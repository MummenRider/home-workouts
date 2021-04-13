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
  final _dialog = locator<DialogService>();
  UserAccount _account;
  UserAccount get account => _account;

  String _numCalories;
  String get numCalories => _numCalories;
  String get caloriesGoal => _account.caloriesGoal;
  void userProfileStream() {
    _db.getUserInRealTime(_auth.user().uid).listen((account) {
      _numCalories = (double.parse(account.currentKcal) /
              double.parse(account.caloriesGoal))
          .toStringAsFixed(2);
      _account = account;
      notifyListeners();
    });
  }

  void goBack() => _nav.clearStackAndShow(Routes.newsFeedView);

  Future<void> updateCalorie(String calories) async {
    var newCalorie = double.parse(calories);
    var currentCal = int.parse(_account.currentKcal);
    var calorieGoal = int.parse(_account.caloriesGoal);
    bool temp = (newCalorie + currentCal) > calorieGoal;

    if (newCalorie == null) return;

    if ((currentCal >= calorieGoal) || temp) {
      await _dialog.showDialog(
          title: 'Calorie Goal Reached',
          description:
              'Going over your current caloric goal may result to caloric surplus');
      return;
    }

    //var calorieInput = (number / int.parse(_account.caloriesGoal));
    // var currentCal = double.parse(_account.currentKcal);
    // var newCal = currentCal + numberConverted;
    // await _db.setCalories(newCal.toStringAsFixed(2), _auth.user().uid);
    var newVal = (int.parse(_account.currentKcal) + int.parse(calories));
    await _db.setCurrentCalories(newVal.toString(), _auth.user().uid);
    _numCalories =
        (newVal / int.parse(_account.caloriesGoal)).toStringAsFixed(2);
    print(_numCalories);
    notifyListeners();
  }

  Future<void> setCalorieGoal(String calories) async {
    _db.setCalorieGoal(calories, _auth.user().uid);
    notifyListeners();
  }

  Future<void> resetCurrentCal() async {
    var response = await _dialog.showConfirmationDialog(
        title: 'Reset Calorie intake?',
        description: 'Your current intake will be set to 0',
        confirmationTitle: 'Confirm',
        cancelTitle: 'Cancel');

    if (!response.confirmed) return;

    await _db.setCurrentCalories('0', _auth.user().uid);
    notifyListeners();
  }
}
