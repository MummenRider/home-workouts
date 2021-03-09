import 'package:app/app/app.router.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  void goToWelcomeScreen() async =>
      _nav.pushNamedAndRemoveUntil(Routes.welcomeView);

  void goToProfile() async => _nav.navigateTo(Routes.userProfileView);
}
