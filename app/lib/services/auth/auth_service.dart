import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User user() => _firebaseAuth.currentUser;

  Future<UserCredential> signUp({
    @required String emailAddress,
    @required String password,
  }) async =>
      _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

  Future<UserCredential> signIn(String email, String password) async =>
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  Future<bool> hasUserLoggedInBefore() async =>
      _firebaseAuth.currentUser != null;

  Future<void> signOut() async => _firebaseAuth.signOut();
}
