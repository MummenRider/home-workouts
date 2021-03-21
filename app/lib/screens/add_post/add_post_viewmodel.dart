import 'dart:io';

import 'package:app/models/new_story.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/database/image_storage.dart';
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
  File _selectedImage;
  File get selectedImage => _selectedImage;
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

  Future<void> uploadImage({
    @required String title,
    @required String description,
  }) async {
    _dbStorage.uploadStoryImage(_selectedImage, Uuid().v4()).then((imageUrl) {
      _dbFiretore.setStory(Story(
          title: title,
          description: description,
          imageURL: imageUrl,
          storyId: Uuid().v4(),
          userId: _auth.user().uid));
    }).then((_) {
      _nav.back();
    }).catchError((e) => print(e.toString()));
  }
}
