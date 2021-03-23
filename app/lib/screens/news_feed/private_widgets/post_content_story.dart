import 'package:app/config/color_palette.dart';
import 'package:app/models/new_story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostContentStory extends StatelessWidget {
  const PostContentStory({
    Key key,
    @required this.story,
    @required this.navigateToDetails,
  }) : super(key: key);

  final Story story;
  final Function navigateToDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              story.title,
              style: const TextStyle(
                color: ColorPalette.postText,
                fontWeight: FontWeight.w500,
                fontSize: 23.0,
              ),
            ),
            const SizedBox(height: 13.0),
            Text(
              story.description,
              style: const TextStyle(
                color: ColorPalette.postText,
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'By ${story.author}',
              style: const TextStyle(
                color: ColorPalette.postText,
                fontWeight: FontWeight.w300,
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }
}
