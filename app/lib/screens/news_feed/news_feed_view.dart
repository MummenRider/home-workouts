import 'package:app/models/new_story.dart';
import 'package:app/public_widgets/lgp_drawer.dart';
import 'package:app/screens/news_feed/private_widgets/post_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'news_feed_viewmodel.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<NewsFeedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        drawer: LGPDrawer(
          model: model,
          size: size,
          context: context,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Home'),
              backgroundColor: Colors.white,
              iconTheme: Theme.of(context).iconTheme,
              shadowColor: Colors.grey,
              pinned: true,
            ),
            StreamBuilder<List<Story>>(
              stream: model.stream,
              builder: (context, snapshot) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (!snapshot.hasData)
                        return CupertinoActivityIndicator();
                      final Story story = snapshot.data[index];

                      return PostContainer(
                          story: story, model: model, context: context);
                    },
                    childCount: snapshot.hasData ? snapshot.data.length : 0,
                  ),
                );
              },
            )
          ],
        ),
      ),
      viewModelBuilder: () => NewsFeedViewModel(),
      onModelReady: (model) => model.loadUserInfo(),
    );
  }
}
