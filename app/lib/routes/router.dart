import 'package:app/screens/sign_in/sign_in_view.dart';
import 'package:app/screens/sign_up/sign_up_view.dart';
import 'package:app/screens/splash/splash_view.dart';
import 'package:app/screens/welcome/welcome_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashView),
    MaterialRoute(page: WelcomeView, initial: true),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
  ],
)
class $LetsGetPhysicalRouter {}
