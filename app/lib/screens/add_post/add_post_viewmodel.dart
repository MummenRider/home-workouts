import 'dart:io';

import 'package:app/models/new_story.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/database/db_image_storage.dart';
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class AddPostViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _dbStorage = locator<FirebaseStorageService>();
  final _auth = locator<AuthService>();
  final _dbFiretore = locator<FirestoreService>();
  final _picker = ImagePicker();
  final _dialog = locator<DialogService>();
  File _selectedImage;
  File get selectedImage => _selectedImage;

  String _imageUrl;
  String get imageUrl => _imageUrl;

  UserAccount _user;
  UserAccount get user => _user;

  void cancelPost() => _nav.back();

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
        print('No Image Selected');
      }
    } else {
      print('denied');
    }
  }

  Future<void> setImageUrl() async {
    try {
      _imageUrl = await _dbStorage.uploadStoryImage(
          file: _selectedImage,
          fileName: Uuid().v4(),
          userId: _auth.user().uid);
    } catch (e) {
      throw ('Image is required');
    }
  }

  Future<void> uploadImage({
    @required String title,
    @required String description,
    @required String author,
    @required String datePosted,
  }) async {
    setBusy(true);
    setImageUrl()
        .then((_) {
          _dbFiretore.setStory(Story(
              title: title,
              description: description,
              imageURL: _imageUrl,
              storyId: Uuid().v4(),
              userId: _auth.user().uid,
              author: author,
              datePosted: datePosted,
              likes: 0));
        })
        .then((_) => _dialog.showDialog(
            title: 'Story Added', description: 'Your story has been posted'))
        .then((_) => _nav.back())
        .whenComplete(() => setBusy(false))
        .catchError((e) {
          _dialog.showDialog(
            title: 'Failed to post story',
            description: 'Reason: ${e.toString()}',
          );
        });
  }
}
