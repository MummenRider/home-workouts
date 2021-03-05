import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User user() => _firebaseAuth.currentUser;

  /// Listens to session auth state
  Stream<User> currentUser() => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp(String email, String password) => _firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signIn(String email, String password) => _firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password);
}
