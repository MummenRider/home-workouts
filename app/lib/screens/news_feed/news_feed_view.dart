import 'package:app/util/hexcolor_convert.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:stacked/stacked.dart';
import 'news_feed_viewmodel.dart';

class NewsFeedView extends StatelessWidget {
  NewsFeedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<NewsFeedViewModel>.reactive(
      onModelReady: (model) => model.loadUserInfo(),
      builder: (context, model, child) => Scaffold(
        drawer: MultiLevelDrawer(
          gradient: LinearGradient(
            colors: [
              Color(hexColor('#c5796d')),
              Color(hexColor('#dbe6f6')),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
          header: Container(
            height: size.height * 0.35,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExtendedImage.network(
                    model.user != null
                        ? model.user.displayProfileURL
                        : 'loading',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    border: Border.all(color: Colors.grey[800], width: 3.0),
                    shape: BoxShape.circle,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    loadStateChanged: (ExtendedImageState state) {
                      if (state.extendedImageLoadState == LoadState.failed) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        );
                      } else if (state.extendedImageLoadState ==
                          LoadState.loading) {
                        return Image.asset(
                          'assets/loading.gif',
                          scale: .5,
                          fit: BoxFit.contain,
                        );
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Clark Inocalla',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  )
                ],
              ),
            ),
          ),
          children: [
            MLMenuItem(
              leading: Icon(Icons.person),
              content: Text('My Profile'),
              onClick: () => model.goToProfile(),
            ),
            MLMenuItem(
              leading: Icon(Icons.fitness_center_outlined),
              content: Text('My Activites'),
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Entypo.newspaper),
              trailing: Icon(Entypo.right_dir),
              content: Text('Post Story'),
              subMenuItems: [
                MLSubmenu(submenuContent: Text('Upload Image'), onClick: () {}),
                MLSubmenu(submenuContent: Text('Upload Video'), onClick: () {})
              ],
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Entypo.logout),
              content: Text('Logout'),
              onClick: () => model.signOut(),
            ),
          ],
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Home',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('News Feed')],
          ),
        ),
      ),
      viewModelBuilder: () => NewsFeedViewModel(),
    );
  }
}
