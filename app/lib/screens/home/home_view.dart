import 'package:app/screens/home/home_viewmodel.dart';
import 'package:app/screens/news_feed/news_feed_view.dart';
import 'package:app/screens/profile/user_profile_view.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Map<int, Widget> _viewCache = Map<int, Widget>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.goToAddPost(),
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: getViewForIndex(model.currentIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          backgroundColor: Theme.of(context).primaryColor,
          opacity: .2,
          currentIndex: model.currentIndex,
          onTap: (index) => model.setIndex(index),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home_outlined,
              ),
              title: Text("Home"),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
              ),
              title: Text("Profile"),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      switch (index) {
        case 0:
          _viewCache[index] = NewsFeedView();
          break;
        case 1:
          _viewCache[index] = UserProfileView();
          break;
      }
    }

    return _viewCache[index];
  }
}
