import 'package:app/models/user_account.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileEditViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _db = locator<FirestoreService>();
  UserAccount _account;

  Future saveUserAccount({
    @required fname,
    @required lname,
    @required email,
    @required phoneNumber,
  }) async {
    print(_account.firstName);
    var updateUser = UserAccount(
      firstName: fname,
      lastName: lname,
      email: email,
      userId: _account.userId,
      phoneNumber: phoneNumber,
    );
    await _db.setUser(updateUser);

    _nav.back();
  }

  void setUserProfile(UserAccount accounts) {
    _account = accounts;
    notifyListeners();
  }

  void cancelEditProfile() => _nav.back();
}
