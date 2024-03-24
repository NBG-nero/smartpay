import 'package:dartz/dartz.dart';
import 'package:smartpay/domain/core/failure/app_failure.dart';

import 'models/user_model.dart';

abstract class IAuthFacade {
  Future<Either<AppFailure, UserModel>> registerUser({
    required String fullname,
    required String username,
    required String email,
    required String country,
    required String password,
    // required String deviceName,
  });

   Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, String>> logout();
  
  Future<Either<AppFailure, String>> getEmailTokenn({required String email});
  
  Future<Either<AppFailure, String>> verifyOtp(
      {required String email, required String token});
}
