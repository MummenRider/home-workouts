import 'package:app/models/new_story.dart';
import 'package:app/screens/news_feed/private_widgets/modal_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../news_feed_viewmodel.dart';

class PostStats extends StatelessWidget {
  final Story story;
  final Function onLikeButtonTapped;
  final NewsFeedViewModel model;

  PostStats(
      {Key key,
      @required this.story,
      @required this.onLikeButtonTapped,
      @required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('stories')
                  .doc(story.storyId)
                  .collection('likes')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return LikeButton(
                    onTap: onLikeButtonTapped,
                    size: 18,
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      isLiked = snapshot.data.docs.length != 0;
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red[300] : Colors.grey,
                        size: 18,
                      );
                    },
                    likeCount: snapshot.data.docs.length,
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
                          'x $text',
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 13,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CommentsViewBottomSheet(
                          story: story,
                          userModel: model,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.comment_outlined,
                      color: Colors.black54,
                    ),
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('stories')
                          .doc(story.storyId)
                          .collection('comments')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Text(
                              'x ${snapshot.data.docs.length.toString()}');
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
