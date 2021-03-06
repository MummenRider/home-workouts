import 'package:app/services/auth/auth_service.dart';
import 'package:app/services/database/db_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(() => DialogService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<FirestoreService>(() => FirestoreService());
}
