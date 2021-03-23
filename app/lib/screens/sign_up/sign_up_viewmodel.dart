import 'dart:io';
import 'package:app/app/app.router.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/database/db_image_storage.dart';
import 'package:app/services/service_locator.dart';
import 'package:app/util/assets_to_file_converter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _dialog = locator<DialogService>();
  final _auth = locator<AuthService>();
  final _db = locator<FirestoreService>();
  final _nav = locator<NavigationService>();
  final _picker = ImagePicker();
  final _dbStorage = locator<FirebaseStorageService>();

  File _selectedImage;
  File get selectedImage => _selectedImage;

  String _imageUrl;
  String get imageUrl => _imageUrl;

  Future<void> selectImage() async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      var tempImage = await _picker.getImage(source: ImageSource.gallery);
      if (tempImage != null) {
        _selectedImage = File(tempImage.path);
        notifyListeners();
      }
    } else {
      _dialog.showDialog(
          title: 'Permission Request',
          description: 'Photo access gallery denied');
    }
  }

  Future<void> setImageUrl(File imageFile) async => _imageUrl = await _dbStorage
      .uploadProfileImage(_selectedImage ?? imageFile, _auth.user().uid);

  Future<void> signUp({
    @required String firstName,
    @required String lastName,
    @required String emailAddress,
    @required String password,
    @required String phoneNumber,
  }) async {
    setBusy(true);
    _auth
        .signUp(
          emailAddress: emailAddress,
          password: password,
          firstName: firstName,
          imageUrl: _imageUrl,
          lastName: lastName,
          phoneNumber: phoneNumber,
        )
        .then((_) => getImageFileFromAssets('/default.png'))
        .then((imageFile) => setImageUrl(imageFile))
        .then((_) => _db.updateProfileImage(_auth.user().uid, _imageUrl))
        .then((_) => _auth.updateFirebaseAuth(
            displayName: firstName, photoURL: _imageUrl))
        .then((_) => _dialog.showDialog(
              title: 'Sign Up Success',
              description: 'Successfully Registered',
            ))
        .then((_) => _nav.pushNamedAndRemoveUntil(Routes.welcomeView))
        .whenComplete(() => setBusy(false))
        .catchError((e) => _dialog.showDialog(
              title: 'Sign Up failed',
              description: e.toString(),
            ));
  }
}
