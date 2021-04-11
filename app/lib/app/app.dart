import 'package:app/screens/add_post/add_post_view.dart';
import 'package:app/screens/news_feed/news_feed_view.dart';
import 'package:app/screens/profile/user_profile_view.dart';
import 'package:app/screens/profile_edit/user_profile_edit_view.dart';
import 'package:app/screens/sign_in/sign_in_view.dart';
import 'package:app/screens/sign_up/sign_up_view.dart';
import 'package:app/screens/splash/splash_view.dart';
import 'package:app/screens/story_edit/edit_story_view.dart';
import 'package:app/screens/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: WelcomeView),
  MaterialRoute(page: NewsFeedView),
  MaterialRoute(page: AddPostView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: UserProfileView),
  MaterialRoute(page: UserProfileEditView),
  MaterialRoute(page: EditStoryView),
])
class AppSetup {
  /**/
}
