import 'package:app/app/app.router.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsFeedViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  void goToWelcomeScreen() async =>
      _nav.pushNamedAndRemoveUntil(Routes.welcomeView);

  void goToProfile() async => _nav.navigateTo(Routes.userProfileView);
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
