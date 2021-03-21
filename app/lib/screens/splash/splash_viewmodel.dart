import 'package:app/app/app.router.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _dialog = locator<DialogService>();
  final _auth = locator<AuthService>();
  final _nav = locator<NavigationService>();

  void hasLoggedInBefore() async => _auth.hasUserLoggedInBefore().then((user) {
        return user == true
            ? _nav.replaceWith(Routes.newsFeedView)
            : _nav.replaceWith(Routes.welcomeView);
      }).catchError((e) {
        _dialog.showDialog(
          title: 'Error',
          description: e.message,
        );
      });
}
