import 'package:app/models/new_story.dart';
import 'package:app/screens/news_feed/news_feed_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../comments_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CommentsViewBottomSheet extends StatefulWidget {
  CommentsViewBottomSheet({
    Key key,
    @required this.story,
    @required this.userModel,
  }) : super(key: key);
  final Story story;
  final NewsFeedViewModel userModel;

  @override
  _CommentsViewBottomSheetState createState() =>
      _CommentsViewBottomSheetState();
}

class _CommentsViewBottomSheetState extends State<CommentsViewBottomSheet> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentsViewBottomSheetModel>.reactive(
      builder: (context, model, child) => Material(
          child: SafeArea(
        top: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Divider(
                      thickness: 4.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Comments',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: model.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot documentSnapshot) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8.0),
                                          child: GestureDetector(
                                            child: CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              radius: 15.0,
                                              backgroundImage: NetworkImage(
                                                documentSnapshot
                                                    .data()['userImage'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            child: Text(
                                              documentSnapshot
                                                  .data()['authorName'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 12.0,
                                            ),
                                            onPressed: () {},
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            child: Text(
                                              documentSnapshot
                                                  .data()['comment'],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 400.0,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 300,
                          height: 20,
                          child: TextField(
                            controller: _commentController,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              hintText: 'Add comment',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.green[400],
                          child: Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            model.addComment(_commentController.text,
                                widget.userModel.user.firstName);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
      onModelReady: (model) => model.setStoryId(widget.story.storyId),
      viewModelBuilder: () => CommentsViewBottomSheetModel(),
    );
  }
}
