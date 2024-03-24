import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../../presenntation/auth/complete_profile/models/country.dart';

@injectable
class ProfileViewModel extends BaseViewModel {
  bool obscurePassword = true;
  Country? selectedCountry;
  selectCountry({required Country country}) {
    selectedCountry = country;
    log(selectedCountry!.toJson().toString());
    notifyListeners();
  }

  togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
