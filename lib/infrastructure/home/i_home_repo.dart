import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/app_failure.dart';
import '../../domain/core/paths.dart';
import '../../domain/home/i_home_facade.dart';
import '../../domain/http_service/http_service.dart';

@LazySingleton(as: IHomeFacade)
class IHomeRepo implements IHomeFacade {
  final IHttpService httpService;
  IHomeRepo({required this.httpService});

  @override
  Future<Either<AppFailure, String>> getSecret() async {
    final failureOrSuccessOption =
        await httpService.getData(path: Paths.dashboard);
    return failureOrSuccessOption.fold((l) {
      return left(l);
    }, (r) {
      String secret = r.value["data"]["secret"];
      return right(secret);
    });
  }
}
