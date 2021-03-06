import 'package:app/models/comments.dart';
import 'package:app/models/new_story.dart';
import 'package:app/models/user_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Story>> getStories() => _firestore
      .collection('stories')
      .orderBy('datePosted')
      .snapshots()
      .map((query) => query.docs)
      .map((snapshot) =>
          snapshot.map((document) => Story.fromJSON(document.data())).toList());

  Stream<List<Story>> getLikes() => _firestore
      .collection('stories')
      .snapshots()
      .map((query) => query.docs)
      .map((snapshot) =>
          snapshot.map((document) => Story.fromJSON(document.data())).toList());

  Future<UserAccount> setUser(UserAccount user) async => _firestore
      .collection('users')
      .doc(user.userId)
      .set(user.toJSON())
      .then((_) => user);

  Future<void> setCurrentCalories(String currentCal, String userId) async =>
      _firestore.collection('users').doc(userId).set({
        'currentKcal': currentCal,
      }, SetOptions(merge: true));

  Future<void> setCalorieGoal(String currentCal, String userId) async =>
      _firestore.collection('users').doc(userId).set({
        'caloriesGoal': currentCal,
      }, SetOptions(merge: true));

  Stream<UserAccount> getUserInRealTime(String userId) =>
      _firestore.collection('users').doc(userId).snapshots().map(
          (DocumentSnapshot snapshot) => UserAccount.fromJSON(snapshot.data()));

  Future<UserAccount> getUser(String userId) async => _firestore
      .collection('users')
      .doc(userId)
      .get()
      .then((snapshot) => UserAccount.fromJSON(snapshot.data()));

  Future<void> setStory(Story story) async =>
      _firestore.collection('stories').doc(story.storyId).set(story.toJSON());

  Future<void> deleteStory(String storyId) async =>
      _firestore.collection('stories').doc(storyId).delete();

  Future<void> updateProfileImage(String userId, String imageUrl) async =>
      _firestore
          .collection('users')
          .doc(userId)
          .update({'displayProfileURL': imageUrl});

  Future<void> updateLike(String storyId, int likes) async =>
      _firestore.collection('stories').doc(storyId).update({'likes': likes++});

  Future<void> addLike(
          {@required String userId, @required String storyId}) async =>
      _firestore
          .collection('stories')
          .doc(storyId)
          .collection('likes')
          .doc(userId)
          .set({'likes': FieldValue.increment(1), 'userId': userId});

  Future<void> flagStory(
          {@required String userId,
          @required String storyId,
          @required String reason}) async =>
      _firestore
          .collection('stories')
          .doc(storyId)
          .collection('flags')
          .doc(userId)
          .set({
        'flags': FieldValue.increment(1),
        'userId': userId,
        'reason': reason
      });

  Future<void> removeLike(
          {@required String userId, @required String storyId}) async =>
      _firestore
          .collection('stories')
          .doc(storyId)
          .collection('likes')
          .doc(userId)
          .delete();

  Future<bool> checkLikeStatus(
          {@required String userId, @required String storyId}) async =>
      _firestore
          .collection('stories')
          .doc(storyId)
          .collection('likes')
          .doc(userId)
          .get()
          .then((snap) => snap.exists);

  Future<int> countNumLikes({@required String storyId}) async => _firestore
      .collection('stories')
      .doc(storyId)
      .collection('likes')
      .get()
      .then((value) => value.size);

  Future addComment(Comment comment, String storyId) async {
    _firestore
        .collection('stories')
        .doc(storyId)
        .collection('comments')
        .doc(comment.comment)
        .set(comment.toJSON());
  }

  Stream<QuerySnapshot> getComments(String storyId) => _firestore
      .collection('stories')
      .doc(storyId)
      .collection('comments')
      .orderBy('time')
      .snapshots();

  Stream<QuerySnapshot> getUsersInfo(String userId) =>
      _firestore.collection('users').snapshots();
}
