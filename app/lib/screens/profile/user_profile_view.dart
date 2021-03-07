import 'package:app/screens/profile/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      onModelReady: (model) => model.loadUserInfo(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: model.user != null
            ? Center(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.account_circle_sharp,
                              size: 30.0,
                              color: Colors.green[400],
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            '${model.user.firstName} ${model.user.lastName}',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(width: 100.0),
                        ],
                      ),
                      Divider(
                        height: 40,
                        thickness: 2,
                        color: Colors.black12,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.call,
                              size: 30.0,
                              color: Colors.green[400],
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            '${model.user.phoneNumber}',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      Divider(
                        height: 40,
                        thickness: 2,
                        color: Colors.black12,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.markunread,
                              size: 30.0,
                              color: Colors.green[400],
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            '${model.user.email} ',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      Divider(
                        height: 40,
                        thickness: 2,
                        color: Colors.black12,
                      ),
                      ElevatedButton(
                        onPressed: () => model.editUserAccount(),
                        child: Text('Edit'),
                      )
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator(),
      ),
      viewModelBuilder: () => UserProfileViewModel(),
    );
  }
}
