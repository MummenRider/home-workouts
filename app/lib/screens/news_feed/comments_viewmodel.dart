import 'dart:async';

import 'package:app/models/comments.dart';
import 'package:app/models/new_story.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CommentsViewBottomSheetModel extends StreamViewModel {
  final _nav = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _db = locator<FirestoreService>();

  Comment _comment;
  String _storyId;
  @override
  Stream<QuerySnapshot> get stream => getComments();

  Stream<QuerySnapshot> getComments() => _db.getComments(_storyId);

  Future addComment(
    String comment,
    String author,
  ) async {
    _db.addComment(
        Comment(
          authorName: _auth.user().displayName,
          comment: comment,
          time: DateTime.now().toIso8601String(),
          userId: _auth.user().uid,
          userImage: _auth.user().photoURL,
        ),
        _storyId);
  }

  setStoryId(String storyId) {
    _storyId = storyId;
    notifyListeners();
  }
}
