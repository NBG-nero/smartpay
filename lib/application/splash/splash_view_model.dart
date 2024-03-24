import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/injectable.dart';
import 'package:smartpay/presenntation/app_router/app_router.gr.dart';
import 'package:stacked/stacked.dart';

import '../../domain/core/constants/app_constants.dart';
import '../../presenntation/app_router/app_router.dart';
import '../home/home_view_model.dart';

@injectable
class SplashViewModel extends BaseViewModel {
  final AppRouter appRouter;

  SplashViewModel({required this.appRouter});
  timedNavigate() async {
    Timer(const Duration(seconds: 10), () {
      navigate();
    });
  }

  navigate() async {
    SharedPreferences.getInstance().then((prefs) {
      bool hasConfirmedregister =
          prefs.getBool(AppConstants.signUpVal) ?? false;
      bool isLoggedIn = prefs.getBool(AppConstants.logInVal) ?? false;
      bool userPinCreated = prefs.getBool(AppConstants.userPinCreated) ?? false;
      if (hasConfirmedregister == true) {
        if (prefs.getString(AppConstants.userAccessToken) == "" ||
            prefs.getString(AppConstants.userAccessToken) == null) {
          debugPrint("Access Denied");
        } else {
          // get the secrettoken
          getIt<HomeViewModel>().getSecret();
          if (isLoggedIn == true) {
            if (userPinCreated == true) {
              appRouter.pushAndPopUntil(const VerifyPinRoute(),
                  predicate: (route) => false);
            } else {
              appRouter.pushAndPopUntil(const CreatePinRoute(),
                  predicate: (route) => false);
            }
          } else {
            appRouter.pushAndPopUntil(const SignInRoute(),
                predicate: (route) => false);
          }
        }
      } else {
        appRouter.replace(const OnBoardingIndexRoute());
      }
    });
  }
}
