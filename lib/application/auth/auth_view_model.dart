import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/application/home/home_view_model.dart';
import 'package:smartpay/domain/core/constants/app_constants.dart';
import 'package:smartpay/presenntation/app_router/app_router.dart';
import 'package:stacked/stacked.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../infrastructure/core/dialog_service.dart';
// import '../../infrastructure/utls/utils.dart';
import '../../injectable.dart';
import '../../presenntation/app_router/app_router.gr.dart';

@injectable
class AuthViewModel extends BaseViewModel {
  final AppRouter appRouter;
  final IAuthFacade iAuthFacade;

  AuthViewModel({required this.appRouter, required this.iAuthFacade});

  SharedPreferences? prefs;
  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool obscurePassword = true;

  togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void getEmailToken({required String email}) async {
    setBusy(true);
    final failureOrSuccessoption =
        await iAuthFacade.getEmailTokenn(email: email);

    return failureOrSuccessoption.fold((l) {
      setBusy(false);
      getIt<DialogService>().showErrorToast(l.message ?? "");
    }, (r) {
      setBusy(false);
      getIt<DialogService>().showSuccessToast("Your otp is $r");
      getIt<AppRouter>().push(OtpAuth(email: email));
    });
  }

  void resendEmailToken() async {
    setBusy(true);
    await initPrefs();
    String? email = prefs?.getString(AppConstants.email);
    if (email != null || email != '') {
      final failureOrSuccessoption =
          await iAuthFacade.getEmailTokenn(email: email!);
      return failureOrSuccessoption.fold((l) {
        setBusy(false);
        getIt<DialogService>().showErrorToast(l.message ?? "");
      }, (r) {
        setBusy(false);
        getIt<DialogService>().showSuccessToast("Your otp is $r");
      });
    }
  }

  void verifyEmailToken({required String email, required String token}) async {
    setBusy(true);
    final failureOrSuccessoption =
        await iAuthFacade.verifyOtp(email: email, token: token);

    return failureOrSuccessoption.fold((l) {
      setBusy(false);
      getIt<DialogService>().showErrorToast(l.message ?? "");
    }, (r) {
      setBusy(false);
      // getIt<DialogService>().showSuccessToast("Your otp is $r");
      getIt<AppRouter>().push(CompleteProfileRoute(email: email));
    });
  }

  bool confirmedregister = false;
  setConfirmedregister(val) async {
    await initPrefs();
    confirmedregister = val;
    await prefs?.setBool(AppConstants.signUpVal, confirmedregister);
    log("confirmedregister is $confirmedregister");
    notifyListeners();
  }

  void register(
      {required String fullname,
      required String username,
      required String email,
      required String country,
      required String password}) async {
    setBusy(true);
    final failureOrSuccessOption = await iAuthFacade.registerUser(
        fullname: fullname,
        username: username,
        email: email,
        country: country,
        password: password);
    log(isBusy.toString());
    return failureOrSuccessOption.fold((l) {
      setBusy(false);
      getIt<DialogService>().showErrorToast(l.message ?? "");
    }, (r) {
      setBusy(false);
      setConfirmedregister(true);
      // getIt<DialogService>().showSuccessToast("Your otp is $r");
      getIt<AppRouter>().push(const CreatePinRoute());
    });
  }

  bool isLoggedIn = false;

  setIsLoggedIn(val) async {
    await initPrefs();
    isLoggedIn = val;
    await prefs?.setBool(AppConstants.logInVal, isLoggedIn);
    log("isLoggedIn is $isLoggedIn");
    notifyListeners();
  }

  void login({required String email, required String password}) async {
    setBusy(true);
    final failureOrSuccessOption =
        await iAuthFacade.login(email: email, password: password);
    return failureOrSuccessOption.fold((l) {
      setBusy(false);
      getIt<DialogService>().showErrorToast(l.message ?? "");
    }, (r) async {
      setBusy(false);
      setConfirmedregister(true);
      setIsLoggedIn(true);
      getIt<HomeViewModel>().getSecret();
      // getIt<HomeViewModel>().getSecretFromPrefs();
      await Future.delayed(const Duration(seconds: 3), () {
        getIt<DialogService>().showSuccessToast("login successful");
        getIt<AppRouter>().push(const HomeRoute());
      });
    });
  }

  saveUserPin(String pin) async {
    setBusy(true);
    await initPrefs();
    debugPrint(pin);
    if (pin != null || pin != '') {
      if (pin.length <= 4 || pin.length >= 6) {
        getIt<DialogService>().showErrorToast('Incomplete pin');
      } else {
        await prefs?.setString(AppConstants.userPin, pin);
        setUserPinCreated(true);
        await Future.delayed(const Duration(seconds: 3), () {
          if (prefs?.getBool(AppConstants.logInVal) == true &&
              prefs?.getBool(AppConstants.userPinCreated) == true) {
            getIt<AppRouter>().push(const VerifyPinRoute());
          } else {
            getIt<AppRouter>().push(const ConnfirmationRouten());
          }
        });

        notifyListeners();
      }
    }
    setBusy(false);
    notifyListeners();
  }

  bool userPinCreated = false;
  setUserPinCreated(val) async {
    await initPrefs();
    userPinCreated = val;
    await prefs?.setBool(AppConstants.userPinCreated, userPinCreated);
    log("userPinCreated is $userPinCreated");
    notifyListeners();
  }

  verifyUserPin(String pin) async {
    setBusy(true);
    await initPrefs();
    debugPrint(pin);
    if (pin != null || pin != '') {
      String? userPin = prefs?.getString(AppConstants.userPin);
      if (pin == userPin) {
        getIt<HomeViewModel>().getSecret();
        await Future.delayed(const Duration(seconds: 3), () {
          getIt<DialogService>().showSuccessToast('Success');
          getIt<AppRouter>().push(const HomeRoute());
        });
      } else {
        getIt<DialogService>().showErrorToast('IncorrectPin');
      }
      setBusy(false);
      notifyListeners();
    }
    notifyListeners();
  }

  void logout() async {
    setBusy(true);
    final failureOrSuccessOption = await iAuthFacade.logout();
    return failureOrSuccessOption.fold((l) {
      setBusy(false);
      getIt<DialogService>().showErrorToast(l.message ?? "");
    }, (r) {
      setBusy(false);
      setIsLoggedIn(false);
      getIt<DialogService>().showSuccessToast(r);
      getIt<AppRouter>().push(const SignInRoute());
    });
  }
}
