import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'news_feed_viewmodel.dart';

class NewsFeedView extends StatelessWidget {
  NewsFeedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsFeedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              tooltip: 'Sign Out',
              onPressed: () => model.goToWelcomeScreen(),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('News Feed'),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NewsFeedViewModel(),
    );
  }
}
