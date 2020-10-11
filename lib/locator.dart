import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/dialog_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/core/services/news_service.dart';
import 'package:blueconnectapp/core/services/user_service.dart';
import 'package:blueconnectapp/core/veiwModels/addview_model.dart';
import 'package:blueconnectapp/core/veiwModels/chatview_model.dart';
import 'package:blueconnectapp/core/veiwModels/createview_model.dart';
import 'package:blueconnectapp/core/veiwModels/feedsview_model.dart';
import 'package:blueconnectapp/core/veiwModels/forgotpasswordview_model.dart';
import 'package:blueconnectapp/core/veiwModels/gettingstartedview_model.dart';
import 'package:blueconnectapp/core/veiwModels/homeview_model.dart';
import 'package:blueconnectapp/core/veiwModels/profileview_model.dart';
import 'package:blueconnectapp/core/veiwModels/settingsview_model.dart';
import 'package:blueconnectapp/core/veiwModels/signInViewModel.dart';
import 'package:blueconnectapp/core/veiwModels/signUpViewModel.dart';
import 'package:blueconnectapp/core/veiwModels/startupview_model.dart';
import 'package:blueconnectapp/core/veiwModels/verificationview_model.dart';
import 'package:blueconnectapp/core/veiwModels/webview_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  // Register Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => GettingStartedViewModel());
  locator.registerLazySingleton(() => SignInViewModel());
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerLazySingleton(() => VerificationViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => FeedsViewModel());
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => AddViewModel());
  locator.registerLazySingleton(() => ForgotPasswordViewModel());
  locator.registerLazySingleton(() => CreateViewModel());
  locator.registerLazySingleton(() => NewsService());
  locator.registerLazySingleton(() => ProfileViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
  locator.registerLazySingleton(() => WebViewModel());

  locator.registerLazySingleton(() => SignUpViewModel());
}