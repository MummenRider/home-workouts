import 'package:app/public_widgets/round_btn_border.dart';
import 'package:app/public_widgets/template_tile.dart';
import 'package:app/screens/profile/user_profile_viewmodel.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      onModelReady: (model) => model.loadUserInfo(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => model.goBack(),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
          body: model.user != null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ExtendedImage.network(
                                model.user.displayProfileURL,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                                shape: BoxShape.circle,
                                loadStateChanged: (ExtendedImageState state) {
                                  if (state.extendedImageLoadState ==
                                      LoadState.failed) {
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
                                    return SpinKitPouringHourglass(
                                        color: Colors.teal);
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Card(
                          elevation: 3.0,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                TemplateListTile(
                                  icon: LineariconsFree.user_1,
                                  text: '${model.user.firstName}',
                                  iconColor: Colors.teal,
                                  iconSize: 18.0,
                                  textSize: 20,
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.grey,
                                ),
                                TemplateListTile(
                                  icon: LineariconsFree.user_1,
                                  text: '${model.user.lastName}',
                                  iconColor: Colors.teal,
                                  iconSize: 18.0,
                                  textSize: 20,
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.grey,
                                ),
                                TemplateListTile(
                                  icon: FontAwesome.mail,
                                  text: '${model.user.email}',
                                  iconColor: Colors.teal,
                                  iconSize: 18.0,
                                  textSize: 20,
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.grey,
                                ),
                                TemplateListTile(
                                  icon: LineariconsFree.phone,
                                  text: '${model.user.phoneNumber}',
                                  iconColor: Colors.teal,
                                  iconSize: 18.0,
                                  textSize: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => model.editUserAccount(),
                            child: RoundBtnBorder(
                              textLabel: 'EDIT',
                              bkgcolor: Colors.teal,
                              fontSize: 15,
                              width: 250,
                              textColor: Colors.teal,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : SpinKitPouringHourglass(color: Colors.teal)),
      viewModelBuilder: () => UserProfileViewModel(),
    );
  }
}
