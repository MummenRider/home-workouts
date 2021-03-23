import 'package:app/models/new_story.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class PostStats extends StatelessWidget {
  final Story story;
  final Function onLikeButtonTapped;
  const PostStats(
      {Key key, @required this.story, @required this.onLikeButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LikeButton(
              onTap: onLikeButtonTapped,
              size: 18,
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.blue[300] : Colors.grey,
                  size: 18,
                );
              },
              likeCount: story.likes,
              countBuilder: (int count, bool isLiked, String text) {
                var color = isLiked ? Colors.blue[300] : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "Show some love",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
            ),
            const SizedBox(
              width: 4.0,
            ),
            SizedBox(
              height: 13,
              width: 60,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => print('liked'),
                    icon: Icon(
                      Icons.comment_outlined,
                      color: Colors.black,
                    ),
                    iconSize: 18,
                    padding: EdgeInsets.all(0.0),
                  ),
                  Text('4')
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
