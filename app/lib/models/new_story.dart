import 'package:flutter/material.dart';

class Story {
  final String title;
  final String description;
  final String imageURL;
  final String userId;
  final String storyId;
  Story({
    @required this.title,
    @required this.description,
    @required this.imageURL,
    @required this.storyId,
    @required this.userId,
  });

  factory Story.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return Story(
      title: json['title'],
      description: json['description'],
      imageURL: json['imageURL'],
      userId: json['userId'],
      storyId: json['storyId'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'title': title,
        'description': description,
        'imageURL': imageURL,
        'storyId': storyId,
        'userId': userId,
      };

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      imageURL.hashCode ^
      userId.hashCode ^
      storyId.hashCode;

  @override
  bool operator ==(other) {
    return (other is Story) &&
        other.title == title &&
        other.description == description &&
        other.storyId == storyId &&
        other.userId == userId &&
        other.imageURL == imageURL;
  }
}
