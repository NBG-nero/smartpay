import 'package:dartz/dartz.dart';
import 'package:smartpay/domain/core/failure/app_failure.dart';

abstract class IHomeFacade {
  Future<Either<AppFailure, String>> getSecret();
  
}
