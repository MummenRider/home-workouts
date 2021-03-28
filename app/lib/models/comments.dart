import 'package:flutter/material.dart';

class Comment {
  final String userId;
  final String userImage;
  final String authorName;
  final String comment;
  final String time;
  Comment({
    @required this.userId,
    @required this.userImage,
    @required this.authorName,
    @required this.comment,
    @required this.time,
  });

  factory Comment.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return Comment(
      userId: json['userId'],
      userImage: json['userImage'],
      authorName: json['authorName'],
      comment: json['comment'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'comment': comment,
        'userId': userId,
        'authorName': authorName,
        'userImage': userImage,
        'time': time,
      };
}
