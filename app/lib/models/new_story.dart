import 'package:flutter/material.dart';

class Story {
  final String title;
  final String description;
  final String imageURL;
  final String author;
  final String datePosted;
  final String userId;
  final String storyId;
  final int likes;
  Story({
    @required this.author,
    @required this.datePosted,
    @required this.title,
    @required this.description,
    @required this.imageURL,
    @required this.storyId,
    @required this.userId,
    @required this.likes,
  });

  factory Story.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return Story(
      title: json['title'],
      datePosted: json['datePosted'],
      author: json['author'],
      description: json['description'],
      imageURL: json['imageURL'],
      userId: json['userId'],
      storyId: json['storyId'],
      likes: json['likes'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'title': title,
        'description': description,
        'imageURL': imageURL,
        'storyId': storyId,
        'userId': userId,
        'author': author,
        'datePosted': datePosted,
        'likes': likes,
      };

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      imageURL.hashCode ^
      userId.hashCode ^
      author.hashCode ^
      datePosted.hashCode ^
      likes.hashCode ^
      storyId.hashCode;

  @override
  bool operator ==(other) {
    return (other is Story) &&
        other.title == title &&
        other.description == description &&
        other.storyId == storyId &&
        other.userId == userId &&
        other.datePosted == datePosted &&
        other.author == author &&
        other.likes == likes &&
        other.imageURL == imageURL;
  }
}
