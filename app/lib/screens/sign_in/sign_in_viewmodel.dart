import 'package:app/app/app.router.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _nav = locator<NavigationService>();
  void signIn({@required String email, @required String password}) async {
    setBusy(true);
    _auth
        .signIn(email, password)
        .then((value) {
          _nav.navigateTo(Routes.homeView,
              arguments: HomeViewArguments(userId: value.user.uid));
        })
        .whenComplete(() => setBusy(false))
        .catchError((e) {
          _dialog.showDialog(
            title: 'Sign in failed',
            description: e.message,
          );
        });
  }
}
