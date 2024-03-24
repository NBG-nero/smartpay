import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smartpay/domain/core/failure/app_failure.dart';

import '../../domain/core/constants/error_messages.dart';

Either<AppFailure, Right> handleResponse(
    {required dynamic body, required int statusCode}) {
  switch (statusCode) {
    case 200:
      // String responseCode = body["responseCode"];
      // if (responseCode == "00") {
      //   // log(body['data']);
      return Right(Right(body));
    // } else {
    //   return Left(AppFailure.serverError(
    //     body["message"],
    //   ));
    // }

    // case 201:
    //   return Right(Right(body));

    case 400:
      log(statusCode.toString());
      return Left(AppFailure.badRequest(
          body["message"] ?? ErrorMessages().badRequestString));
    case 401:
      log(statusCode.toString());
      return Left(AppFailure.unAuthorized(
          body["message"] ?? ErrorMessages().unAuthorizedString));
    case 500:
      log(statusCode.toString());
      log(body["message"]);
      return Left(AppFailure.serverError(
        body["message"] ?? ErrorMessages().serverErrorString,
      ));

    default:
      return Left(AppFailure.serverError(
        body["message"] ?? ErrorMessages().serverErrorString,
      ));
  }
}
