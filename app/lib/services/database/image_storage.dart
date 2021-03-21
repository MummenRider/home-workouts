import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _dbStorage = FirebaseStorage.instance;

  Future<String> uploadStoryImage(File file, String fileName) async =>
      _dbStorage
          .ref()
          .child('imageStory/$fileName')
          .putFile(file)
          .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());

  Future<String> displayProfile(File file, String fileName) async => _dbStorage
      .ref()
      .child('profileImage/$fileName')
      .putFile(file)
      .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
}
