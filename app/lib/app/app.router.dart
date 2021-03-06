// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/new_story.dart';
import '../models/user_account.dart';
import '../screens/activity/activity_view.dart';
import '../screens/add_post/add_post_view.dart';
import '../screens/news_feed/news_feed_view.dart';
import '../screens/profile/user_profile_view.dart';
import '../screens/profile_edit/user_profile_edit_view.dart';
import '../screens/sign_in/sign_in_view.dart';
import '../screens/sign_up/sign_up_view.dart';
import '../screens/splash/splash_view.dart';
import '../screens/story_edit/edit_story_view.dart';
import '../screens/welcome/welcome_view.dart';

class Routes {
  static const String splashView = '/';
  static const String welcomeView = '/welcome-view';
  static const String newsFeedView = '/news-feed-view';
  static const String addPostView = '/add-post-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String userProfileView = '/user-profile-view';
  static const String userProfileEditView = '/user-profile-edit-view';
  static const String editStoryView = '/edit-story-view';
  static const String activityView = '/activity-view';
  static const all = <String>{
    splashView,
    welcomeView,
    newsFeedView,
    addPostView,
    signInView,
    signUpView,
    userProfileView,
    userProfileEditView,
    editStoryView,
    activityView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.newsFeedView, page: NewsFeedView),
    RouteDef(Routes.addPostView, page: AddPostView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.userProfileEditView, page: UserProfileEditView),
    RouteDef(Routes.editStoryView, page: EditStoryView),
    RouteDef(Routes.activityView, page: ActivityView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    NewsFeedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NewsFeedView(),
        settings: data,
      );
    },
    AddPostView: (data) {
      var args = data.getArgs<AddPostViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddPostView(
          key: args.key,
          userAccount: args.userAccount,
        ),
        settings: data,
      );
    },
    SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignInView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    UserProfileView: (data) {
      var args = data.getArgs<UserProfileViewArguments>(
        orElse: () => UserProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileView(key: args.key),
        settings: data,
      );
    },
    UserProfileEditView: (data) {
      var args = data.getArgs<UserProfileEditViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileEditView(account: args.account),
        settings: data,
      );
    },
    EditStoryView: (data) {
      var args = data.getArgs<EditStoryViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditStoryView(
          key: args.key,
          story: args.story,
        ),
        settings: data,
      );
    },
    ActivityView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ActivityView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddPostView arguments holder class
class AddPostViewArguments {
  final Key key;
  final UserAccount userAccount;
  AddPostViewArguments({this.key, @required this.userAccount});
}

/// UserProfileView arguments holder class
class UserProfileViewArguments {
  final Key key;
  UserProfileViewArguments({this.key});
}

/// UserProfileEditView arguments holder class
class UserProfileEditViewArguments {
  final UserAccount account;
  UserProfileEditViewArguments({@required this.account});
}

/// EditStoryView arguments holder class
class EditStoryViewArguments {
  final Key key;
  final Story story;
  EditStoryViewArguments({this.key, @required this.story});
}
