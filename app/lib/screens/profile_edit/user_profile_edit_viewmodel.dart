import 'dart:io';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/database/db_image_storage.dart';
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileEditViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _db = locator<FirestoreService>();
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _picker = ImagePicker();
  final _dbStorage = locator<FirebaseStorageService>();

  File _selectedImage;
  File get selectedImage => _selectedImage;
  UserAccount _account;
  UserAccount get accounts => _account;
  String _imageUrl;
  String get imageUrl => _imageUrl;

  Future<void> selectImage() async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      print('granted');
      var tempImage = await _picker.getImage(source: ImageSource.gallery);

      if (tempImage != null) {
        _selectedImage = File(tempImage.path);
        notifyListeners();
      } else {
        print('No Path Received');
      }
    } else {
      print('denied');
    }
  }

  Future<void> setImageUrl() async => _imageUrl = _selectedImage != null
      ? await _dbStorage.uploadProfileImage(_selectedImage, _account.userId)
      : _imageUrl = _account.displayProfileURL;

  Future saveUserAccount({
    @required fname,
    @required lname,
    @required email,
    @required phoneNumber,
  }) async {
    setBusy(true);
    setImageUrl()
        .then((_) {
          var updateUser = UserAccount(
            firstName: fname,
            lastName: lname,
            email: email,
            userId: _account.userId,
            phoneNumber: phoneNumber,
            displayProfileURL: _imageUrl,
          );

          _db.setUser(updateUser);
        })
        .then((_) {
          _auth.updateFirebaseAuth(displayName: fname, photoURL: _imageUrl);
          notifyListeners();
        })
        .then((_) => _dialog.showDialog(
            title: 'User Account', description: 'Changes made has been saved'))
        .then((_) => _nav.back())
        .whenComplete(() => setBusy(false))
        .catchError((e) {
          _dialog.showDialog(
            title: 'Failed to update user profile',
            description: e.toString(),
          );
        });
  }

  void setUserProfile(UserAccount accounts) {
    _account = accounts;
    notifyListeners();
  }

  void cancelEditProfile() => _nav.back();
}
