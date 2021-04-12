import 'package:app/models/user_account.dart';
import 'package:app/services/database/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service_locator.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestoreService = locator<FirestoreService>();
  User user() => _firebaseAuth.currentUser;

  Future<void> signUp({
    @required String emailAddress,
    @required String password,
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String imageUrl,
    @required String aboutMe,
  }) async =>
      _firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((authResponse) {
        _firestoreService.setUser(UserAccount(
          firstName: firstName,
          lastName: lastName,
          email: emailAddress,
          phoneNumber: phoneNumber,
          userId: authResponse.user.uid,
          displayProfileURL: imageUrl,
          aboutMe: aboutMe,
        ));
      });

  Future<UserCredential> signIn(String email, String password) async =>
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  Future<bool> hasUserLoggedInBefore() async =>
      _firebaseAuth.currentUser != null;

  Future<void> signOut() async => _firebaseAuth.signOut();

  Future<void> updateFirebaseAuth(
          {@required String displayName, @required String photoURL}) async =>
      _firebaseAuth.currentUser
          .updateProfile(displayName: displayName, photoURL: photoURL);
}
