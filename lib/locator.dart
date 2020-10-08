import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/dialog_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  // Register Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());
}