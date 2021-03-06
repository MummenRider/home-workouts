import 'package:app/models/user_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setUser(UserAccount user) async =>
      _firestore.collection('users').doc(user.userId).set(user.toJSON());

  Future<UserAccount> getUser(String userId) async {
    return _firestore
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => UserAccount.fromJSON(snapshot.data()));
  }
}
