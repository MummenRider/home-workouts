import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _dialog = locator<DialogService>();
  final _auth = locator<AuthService>();
  final _db = locator<FirestoreService>();
  final _nav = locator<NavigationService>();

  Future<void> signUp({
    @required String firstName,
    @required String lastName,
    @required String emailAddress,
    @required String password,
  }) async {
    setBusy(true);
    _auth
        .signUp(emailAddress: emailAddress, password: password)
        .then((response) {
          _db.setUser(UserAccount(
            firstName: firstName,
            lastName: lastName,
            email: response.user.email,
            userId: response.user.uid,
          ));
          _nav.back();
        })
        .whenComplete(() => setBusy(false))
        .catchError((e) {
          _dialog.showDialog(
            title: 'Sign Up failed',
            description: e.code.toString(),
          );
        });
  }
}
