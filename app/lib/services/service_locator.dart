import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
