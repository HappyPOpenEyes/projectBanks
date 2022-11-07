import 'package:flutter/material.dart';
import 'package:project_bank/presentation/edit_credential/edit_credential.dart';
import 'package:project_bank/presentation/hosting_details/hosting_details.dart';
import 'package:project_bank/presentation/resources/strings_manager.dart';
import 'package:project_bank/presentation/splash/splash.dart';

import '../../app/di.dart';
import '../credential/credential_page.dart';
import '../forgot_password/forgot_password.dart';
import '../home/home_page.dart';
import '../login/login.dart';

class Routes{

  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String credentialRoute = "/credential";
  static const String hostingDetailRoute = "/hostingDetails";
  static const String editCredentialRoute = "/editCredential";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      // case Routes.forgotPasswordRoute:
      //  // initForgotPasswordModule();
      //   return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
       case Routes.mainRoute:
         initHostingModule();
          return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.credentialRoute:
      //   initHomeModule();
       // return MaterialPageRoute(builder: (_) => const CrediantialPage());
      case Routes.editCredentialRoute:
      //   initHomeModule();
       // return MaterialPageRoute(builder: (_) => const EditCredential());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoutFound),
              ),
              body: const Center(child: Text(AppStrings.noRoutFound)),
            ));
  }
}
