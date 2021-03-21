import 'package:app/models/new_story.dart';
import 'package:app/models/user_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<UserAccount> setUser(UserAccount user) async => _firestore
      .collection('users')
      .doc(user.userId)
      .set(user.toJSON())
      .then((_) => user);

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

  Future<void> setStory(Story story) async =>
      _firestore.collection('stories').doc(story.storyId).set(story.toJSON());

  Future<void> updateProfileImage(String userId, String imageUrl) async =>
      _firestore
          .collection('users')
          .doc(userId)
          .update({'displayProfileURL': imageUrl});
}
