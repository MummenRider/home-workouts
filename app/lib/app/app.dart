import 'package:app/screens/home/home_view.dart';
import 'package:app/screens/profile/user_profile_view.dart';
import 'package:app/screens/profile_edit/user_profile_edit_view.dart';
import 'package:app/screens/sign_in/sign_in_view.dart';
import 'package:app/screens/sign_up/sign_up_view.dart';
import 'package:app/screens/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: WelcomeView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: UserProfileView),
  MaterialRoute(page: UserProfileEditView),
])
class AppSetup {
  /**/
}
