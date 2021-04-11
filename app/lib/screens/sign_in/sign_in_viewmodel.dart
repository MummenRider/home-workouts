import 'package:app/app/app.router.dart';
import 'package:app/screens/sign_up/sign_up_view.dart';
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
          Future.delayed(Duration(seconds: 3)).then((_) {
            setBusy(false);
            _nav.pushNamedAndRemoveUntil(Routes.newsFeedView);
          });
        })
        .whenComplete(() =>
            Future.delayed(Duration(seconds: 5)).then((_) => setBusy(false)))
        .catchError((e) {
          _dialog.showDialog(
            title: 'Sign in failed',
            description: e.message,
          );
        });
  }

  void goToSignUp() =>
      _nav.navigateWithTransition(SignUpView(), transition: 'downToUp');
}
