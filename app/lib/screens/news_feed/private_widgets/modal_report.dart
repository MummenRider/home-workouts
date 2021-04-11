import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app/models/new_story.dart';
import 'package:app/screens/news_feed/news_feed_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalInfo extends StatelessWidget {
  final Story story;
  final NewsFeedViewModel model;
  const ModalInfo({Key key, @required this.story, @required this.model})
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
            title: Text('Report'),
            subtitle: Text('Unappropriate content'),
            leading: Icon(
              Icons.flag,
              color: Colors.red,
              size: 25,
            ),
            onTap: () async {
              final text = await showTextInputDialog(
                context: context,
                textFields: const [
                  DialogTextField(
                    hintText: 'reason...',
                  ),
                ],
                title: 'Report story',
                message: 'Tell us why this story is unappropriate',
              );

              text == null
                  ? print('canceled')
                  : model.flagPost(
                      story, text.length >= 1 ? text.join('') : '');
            },
          ),
          ListTile(
            title: Text('Follow ${story.author}'),
            leading: Icon(Icons.star),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ));
  }
}
