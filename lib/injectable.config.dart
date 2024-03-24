// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_view_model.dart' as _i13;
import 'application/home/home_view_model.dart' as _i14;
import 'application/profile/profile_view_model.dart' as _i7;
import 'application/splash/splash_view_model.dart' as _i8;
import 'domain/auth/i_auth_facade.dart' as _i9;
import 'domain/home/i_home_facade.dart' as _i11;
import 'domain/http_service/http_service.dart' as _i5;
import 'infrastructure/auth/i_auth_repo.dart' as _i10;
import 'infrastructure/core/dialog_service.dart' as _i4;
import 'infrastructure/core/http_impl.dart' as _i6;
import 'infrastructure/home/i_home_repo.dart' as _i12;
import 'presenntation/app_router/app_router.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.DialogService>(() => _i4.DialogService());
    gh.lazySingleton<_i5.IHttpService>(() => _i6.IHttpRepo());
    gh.factory<_i7.ProfileViewModel>(() => _i7.ProfileViewModel());
    gh.factory<_i8.SplashViewModel>(
        () => _i8.SplashViewModel(appRouter: gh<_i3.AppRouter>()));
    gh.lazySingleton<_i9.IAuthFacade>(
        () => _i10.IAuthRepo(httpService: gh<_i5.IHttpService>()));
    gh.lazySingleton<_i11.IHomeFacade>(
        () => _i12.IHomeRepo(httpService: gh<_i5.IHttpService>()));
    gh.factory<_i13.AuthViewModel>(() => _i13.AuthViewModel(
          appRouter: gh<_i3.AppRouter>(),
          iAuthFacade: gh<_i9.IAuthFacade>(),
        ));
    gh.factory<_i14.HomeViewModel>(() => _i14.HomeViewModel(
          gh<_i4.DialogService>(),
          appRouter: gh<_i3.AppRouter>(),
          iHomeFacade: gh<_i11.IHomeFacade>(),
        ));
    return this;
  }
}
