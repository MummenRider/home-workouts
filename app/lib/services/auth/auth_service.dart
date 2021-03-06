import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User user() => _firebaseAuth.currentUser;

  /// Listens to session auth state
  Stream<User> currentUser() => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp({
    @required String emailAddress,
    @required String password,
  }) async =>
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

  Future<UserCredential> signIn(String email, String password) async =>
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
}
