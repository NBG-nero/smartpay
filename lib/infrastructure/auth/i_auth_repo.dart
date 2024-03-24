import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:smartpay/domain/auth/models/user_model.dart';

import 'package:smartpay/domain/core/failure/app_failure.dart';
import 'package:smartpay/domain/core/paths.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/constants/app_constants.dart';
import '../../domain/http_service/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAuthFacade)
class IAuthRepo implements IAuthFacade {
  final IHttpService httpService;

  IAuthRepo({required this.httpService});
  @override
  Future<Either<AppFailure, String>> getEmailTokenn(
      {required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var payload = {"email": email};
    prefs.setString(AppConstants.email, email);
    log(payload.toString());
    final failureOrSuccessOption =
        await httpService.post(payload: payload, path: Paths.emailToken);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      String value = r.value["data"]["token"];
      // log(r.value.toString());
      return right(value);
    });
  }

  @override
  Future<Either<AppFailure, UserModel>> registerUser({
    required String fullname,
    required String username,
    required String email,
    required String country,
    required String password,
    // required String deviceName
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var payload = {
      "full_name": fullname,
      "username": username,
      "email": email,
      "country": country,
      "password": password,
      "device_name": "mobile"
    };
    log(payload.toString());
    final failureOrSuccessOption =
        await httpService.post(payload: payload, path: Paths.register);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      UserModel userModel = UserModel.fromMap(r.value["data"]["user"]);
      String token = r.value["data"]["token"];
      prefs.setString(AppConstants.userAccessToken, token);
      // log(r.value.toString());
      return right(userModel);
    });
  }

  @override
  Future<Either<AppFailure, String>> verifyOtp(
      {required String email, required String token}) async {
    var payload = {"email": email, "token": token};
    log(payload.toString());
    final failureOrSuccessOption =
        await httpService.post(payload: payload, path: Paths.verifyEmail);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      String value = r.value["data"]["email"];
      // log(r.value.toString());
      return right(value);
    });
  }

  @override
  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var payload = {
      "email": email,
      "password": password,
      "device_name": "mobile"
    };
    log(payload.toString());
    final failureOrSuccessOption =
        await httpService.post(payload: payload, path: Paths.login);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      UserModel userModel = UserModel.fromMap(r.value["data"]["user"]);
      String token = r.value["data"]["token"];
      prefs.setString(AppConstants.userAccessToken, token);
      // log(r.value.toString());
      return right(userModel);
    });
  }

  @override
  Future<Either<AppFailure, String>> logout() async {
    final failureOrSuccessOption =
        await httpService.logout(path: Paths.logout);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      String message = r.value["message"];
      return right(message);
    });
  }
}
