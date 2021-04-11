import 'package:app/models/new_story.dart';
import 'package:app/screens/news_feed/news_feed_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalEdit extends StatelessWidget {
  final NewsFeedViewModel model;
  final Story story;
  const ModalEdit({Key key, @required this.model, @required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => model.editStory(story),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => model.deletePost(story.storyId),
          )
        ],
      ),
    ));
  }
}
