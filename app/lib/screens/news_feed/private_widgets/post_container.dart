import 'package:app/models/new_story.dart';
import 'package:app/screens/news_feed/news_feed_viewmodel.dart';
import 'package:app/screens/news_feed/private_widgets/modal_edit.dart';
import 'package:app/screens/news_feed/private_widgets/post_content_story.dart';
import 'package:app/screens/news_feed/private_widgets/post_image_story.dart';
import 'package:app/screens/news_feed/private_widgets/post_stats.dart';
import 'package:app/screens/news_feed/private_widgets/modal_report.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PostContainer extends StatelessWidget {
  final BuildContext context;
  final Story story;
  final NewsFeedViewModel model;
  const PostContainer(
      {Key key,
      @required this.story,
      @required this.model,
      @required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      padding: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostImageStory(
                  imageUrl: story.imageURL,
                ),
                const SizedBox(width: 8.0),
                PostContentStory(
                  story: story,
                  navigateToDetails: model.goToAddPost,
                ),
                GestureDetector(
                  onTap: () {
                    if (story.userId == model.userAccount.uid) {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => ModalEdit(
                          model: model,
                          story: story,
                        ),
                        barrierColor: Colors.black38,
                      );
                    } else {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => ModalInfo(
                          story: story,
                          model: model,
                        ),
                        barrierColor: Colors.black38,
                      );
                    }
                  },
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: PostStats(
                story: story,
                onLikeButtonTapped: (isLiked) async {
                  await model.onLikeButtonTapped(isLiked, story);
                },
                model: model,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
