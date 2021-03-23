import 'package:app/app/app.router.dart';
import 'package:app/models/new_story.dart';
import 'package:app/models/user_account.dart';
import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:app/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsFeedViewModel extends StreamViewModel {
  final _nav = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _db = locator<FirestoreService>();

  User get userAccount => _auth.user();

  UserAccount _user;
  UserAccount get user => _user;

  @override
  Stream get stream => getStories();

  Stream<List<Story>> getStories() => _db.getStories();

  void goToProfile() async => _nav.navigateTo(Routes.userProfileView);
  void goBack() async => _nav.back();
  void loadUserInfo() {
    _db.getUserInRealTime(_auth.user().uid).listen((account) {
      _user = account;
      notifyListeners();
    });
  }

  void goToAddPost() => _nav.navigateTo(Routes.addPostView,
      arguments: AddPostViewArguments(userAccount: _user));

  void signOut() async => _auth.signOut().then((_) {
        _nav.pushNamedAndRemoveUntil(Routes.welcomeView);
      }).catchError((e) {
        _dialog.showDialog(
          title: 'Sign in failed',
          description: e.message,
        );
      });

  Future<bool> onLikeButtonTapped(bool isLiked, Story story) async {
    var status = await _db.checkLikeStatus(
        storyId: story.storyId, userId: _auth.user().uid);

    if (!status) {
      await _db.addLike(userId: _auth.user().uid, storyId: story.storyId);
    } else {
      await _db.removeLike(storyId: story.storyId, userId: _auth.user().uid);
    }

    print(!isLiked);
    return !isLiked;
  }
}
