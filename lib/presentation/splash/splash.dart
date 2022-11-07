import 'dart:async';

import 'package:flutter/material.dart';
import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;
  //AppPreferences _appPreferences = instance<AppPreferences>();
  _startDelay(){
    _timer = Timer(Duration(seconds: 2),_goNext);
  }
  _goNext() async {
   _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
     if (isUserLoggedIn)
       {
         // navigate to main screen
         Navigator.pushReplacementNamed(context, Routes.mainRoute)
       }
     else
     {
        Navigator.pushReplacementNamed(
            context, Routes.loginRoute)
     }
   });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold (backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageAssets.splashLogo),),
               const SizedBox(
                height: AppSize.s16,
                 ),
                 Padding(padding: const EdgeInsets.only(
                     left: AppPadding.p28, right: AppPadding.p28),
                   child:  Text(AppStrings.projectBank,
                       style: Theme.of(context).textTheme.headlineLarge),
                 ),
            ],
          ),
        )
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold (backgroundColor: Colors.white,
  //       body: Center(
  //         child: Image(image: AssetImage(ImageAssets.splashLogo),),
  //       )
  //   );
  // }
}