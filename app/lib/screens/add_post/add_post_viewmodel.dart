import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddPostViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  void cancelPost() => _nav.back();
}
