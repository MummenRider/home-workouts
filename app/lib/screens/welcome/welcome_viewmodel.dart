import 'package:app/app/app.router.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  void goToSignInScreen() => _navService.navigateTo(Routes.signInView);
  void goToSignUpScreen() => _navService.navigateTo(Routes.signUpView);
}
