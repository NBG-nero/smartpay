import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/domain/core/constants/app_constants.dart';

import 'package:smartpay/domain/core/failure/app_failure.dart';
import 'package:http/http.dart' as http;

import '../../domain/core/constants/error_messages.dart';
import '../../domain/core/env.dart';
import '../../domain/http_service/http_service.dart';
import 'handler.dart';

@LazySingleton(as: IHttpService)
class IHttpRepo implements IHttpService {
  Duration timout = const Duration(seconds: 60);

  @override
  Future<Either<AppFailure, Right>> delete({required String path}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, Right>> getData({required String path}) async {
    final String url = baseUrl + path;
    log("this is the urllllllll $url");
    try {
      final response = await http
          .get(Uri.parse(url), headers: await getHeaders())
          .timeout(timout);
      log(response.body);
      var body = json.decode(response.body);
      log(body.toString());
      return handleResponse(body: body, statusCode: response.statusCode);
    } on TimeoutException catch (e) {
      log(e.toString());
      return Left(AppFailure.connectionTimeOut(ErrorMessages().timeoutString));
    } on SocketException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } on http.ClientException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } catch (e) {
      log(e.toString());
      return Left(AppFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, Right>> patch(
      {required Map<String, dynamic> payload, required String path}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, Right>> post(
      {required Map<String, dynamic> payload, required String path}) async {
    final String url = baseUrl + path;
    log("this is the urllllllll $url");
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: await getHeaders(), body: json.encode(payload))
          .timeout(timout);
      log(payload.toString());
      var body = json.decode(response.body);
      log(body.toString());
      return handleResponse(body: body, statusCode: response.statusCode);
    } on TimeoutException catch (e) {
      log(e.toString());
      return Left(AppFailure.connectionTimeOut(ErrorMessages().timeoutString));
    } on SocketException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } on http.ClientException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } catch (e) {
      log(e.toString());
      return Left(AppFailure.serverError(
          // ErrorMessages().serverErrorString,
          e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, Right>> postFormData(
      {required Map<String, String> payload, required String path}) {
    // TODO: implement postFormData
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, Right>> put(
      {required Map<String, dynamic> payload, required String path}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(AppConstants.userAccessToken);

    // var token = await _localStorage.readData("token");
    log(" this is the accessToken $accessToken");
    return <String, String>{
      'Content-Type': 'application/json',

      // ignore: unnecessary_brace_in_string_interps
      'Authorization': "Bearer ${accessToken}"
    };
  }

  @override
  Future<Either<AppFailure, Right>> logout({required String path}) async {
    final String url = baseUrl + path;
    log("this is the urllllllll $url");
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: await getHeaders(),
          )
          .timeout(timout);
      var body = json.decode(response.body);
      log(body.toString());
      return handleResponse(body: body, statusCode: response.statusCode);
    } on TimeoutException catch (e) {
      log(e.toString());
      return Left(AppFailure.connectionTimeOut(ErrorMessages().timeoutString));
    } on SocketException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } on http.ClientException catch (e) {
      log(e.toString());
      return Left(
          AppFailure.socketException(ErrorMessages().socketExceptionString));
    } catch (e) {
      log(e.toString());
      return Left(AppFailure.serverError(e.toString()));
    }
  }
}
