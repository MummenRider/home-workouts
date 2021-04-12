import 'package:app/app/app.router.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivityViewModel extends BaseViewModel {
  final _db = locator<FirestoreService>();
  final _auth = locator<AuthService>();
  final _nav = locator<NavigationService>();
  UserAccount _account;
  UserAccount get account => _account;

  void userProfileStream() {
    _db.getUserInRealTime(_auth.user().uid).listen((account) {
      _account = account;
      notifyListeners();
    });
  }

  void goBack() => _nav.clearStackAndShow(Routes.newsFeedView);
}
