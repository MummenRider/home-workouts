import 'package:app/app/app.router.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsFeedViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _db = locator<FirestoreService>();

  User get userAccount => _auth.user();
  UserAccount _user;
  UserAccount get user => _user;

  void goToProfile() async => _nav.navigateTo(Routes.userProfileView);

  loadUserInfo() {
    _db.getUserInRealTime(_auth.user().uid).listen((account) {
      _user = account;
      notifyListeners();
    });
  }

  void signOut() async => _auth.signOut().then((_) {
        _nav.pushNamedAndRemoveUntil(Routes.welcomeView);
      }).catchError((e) {
        _dialog.showDialog(
          title: 'Sign in failed',
          description: e.message,
        );
      });
}
