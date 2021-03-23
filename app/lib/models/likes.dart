import 'package:flutter/material.dart';

class Likes {
  final int likes;
  final String userId;

  Likes({
    @required this.likes,
    @required this.userId,
  });

  factory Likes.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return Likes(
      userId: json['userId'],
      likes: json['likes'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'likes': likes,
        'userId': userId,
      };

  @override
  int get hashCode => likes.hashCode ^ userId.hashCode;

  @override
  bool operator ==(other) {
    return (other is Likes) && other.likes == likes && other.userId == userId;
  }
}
