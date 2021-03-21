import 'package:app/app/app.router.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends BaseViewModel {
  final _db = locator<FirestoreService>();
  final _nav = locator<NavigationService>();
  final _auth = locator<AuthService>();

  UserAccount _user;
  UserAccount get user => _user;

  void loadUserInfo() {
    _db.getUserInRealTime(_auth.user().uid).listen((account) {
      _user = account;
      notifyListeners();
    });
  }

  void editUserAccount() {
    _nav.navigateTo(Routes.userProfileEditView,
        arguments: UserProfileEditViewArguments(account: _user));
  }
}
