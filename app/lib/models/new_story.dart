import 'package:flutter/material.dart';

class Story {
  final String title;
  final String description;
  final String imageURL;

  Story({
    @required this.title,
    @required this.description,
    @required this.imageURL,
  });

  factory Story.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return Story(
      title: json['title'],
      description: json['description'],
      imageURL: json['imageURL'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'title': title,
        'description': description,
        'imageURL': imageURL,
      };

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ imageURL.hashCode;

  @override
  bool operator ==(other) {
    return (other is Story) &&
        other.title == title &&
        other.description == description &&
        other.imageURL == imageURL;
  }
}
