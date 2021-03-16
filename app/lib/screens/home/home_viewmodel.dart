import 'package:app/app/app.router.dart';
import 'package:app/screens/add_post/add_post_view.dart';
import 'package:app/services/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _nav = locator<NavigationService>();
  Future goToAddPost() async =>
      _nav.navigateWithTransition(AddPostView(), transition: 'downToUp');
}
