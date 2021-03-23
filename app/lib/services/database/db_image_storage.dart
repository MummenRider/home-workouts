import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageService {
  final _dbStorage = FirebaseStorage.instance;

  Future<String> uploadStoryImage({
    @required File file,
    @required String fileName,
    @required String userId,
  }) async =>
      _dbStorage
          .ref()
          .child('imageStory/$userId/$fileName')
          .putFile(file)
          .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());

  Future<String> uploadProfileImage(File file, String fileName) async =>
      _dbStorage
          .ref()
          .child('profileImage/$fileName')
          .putFile(file)
          .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
}
