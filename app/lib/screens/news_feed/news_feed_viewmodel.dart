import 'package:app/app/app.router.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsFeedViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();

  void goToProfile() async => _nav.navigateTo(Routes.userProfileView);
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void goToWelcomeScreen() async => _auth.signOut().then((_) {
        _nav.pushNamedAndRemoveUntil(Routes.welcomeView);
      }).catchError((e) {
        _dialog.showDialog(
          title: 'Sign in failed',
          description: e.message,
        );
      });
}
