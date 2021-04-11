import 'package:app/screens/news_feed/news_feed_viewmodel.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class LGPDrawer extends StatelessWidget {
  const LGPDrawer(
      {Key key,
      @required this.size,
      @required this.model,
      @required this.context})
      : super(key: key);

  final Size size;
  final NewsFeedViewModel model;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return MultiLevelDrawer(
      backgroundColor: Color(0xfff4f9f4),
      header: Container(
        height: size.height * 0.35,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.network(
                model.user != null ? model.user.displayProfileURL : 'loading',
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
                '${model.user.firstName} ${model.user.lastName} ',
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
            onClick: () => model.goToProfile()),
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
            MLSubmenu(
                submenuContent: Text('Upload Image'),
                onClick: () => model.goToAddPost()),
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
    );
  }
}
