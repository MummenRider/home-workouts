import 'package:app/models/user_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setUser(UserAccount user) async =>
      _firestore.collection('users').doc(user.userId).set(user.toJSON());

  Stream<UserAccount> getUserInRealTime(String userId) =>
      _firestore.collection('users').doc(userId).snapshots().map(
          (DocumentSnapshot snapshot) => UserAccount.fromJSON(snapshot.data()));

  Future<UserAccount> getUser(String userId) async {
    return await _firestore
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => UserAccount.fromJSON(snapshot.data()));
  }
}
