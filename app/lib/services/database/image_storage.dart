import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _dbStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String fileName) => _dbStorage
      .ref()
      .child('imageStory/$fileName')
      .putFile(file)
      .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
}
