import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/domain/core/constants/app_constants.dart';
import 'package:smartpay/infrastructure/core/dialog_service.dart';
import 'package:stacked/stacked.dart';

import '../../domain/home/i_home_facade.dart';
import '../../injectable.dart';
import '../../presenntation/app_router/app_router.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final AppRouter appRouter;
  final IHomeFacade iHomeFacade;
  final DialogService dialogService;

  HomeViewModel(this.dialogService,
      {required this.appRouter, required this.iHomeFacade});

  SharedPreferences? prefs;
  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void getSecret() async {
    await initPrefs();
    setBusy(true);
    final failureOrSuccessoption = await iHomeFacade.getSecret();
    return failureOrSuccessoption.fold((l) {
      setBusy(false);
      dialogService.showErrorToast(l.message ?? "");
    }, (r) async {
      setBusy(false);
      await prefs?.setString(AppConstants.secret, r);
      notifyListeners();
    });
  }

  String? appSecret;
  getSecretFromPrefs() async {
    await initPrefs();
    var secret = prefs?.getString(AppConstants.secret);
    if (secret != null || secret != '') {
      appSecret = secret;
      debugPrint('this is app secret $appSecret');
      notifyListeners();
    } else {
      debugPrint('secret is null');
    }
    notifyListeners();
  }

  logout() {
    return getIt<AuthViewModel>().logout();
  }
}
