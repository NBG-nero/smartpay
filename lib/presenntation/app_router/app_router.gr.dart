// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:smartpay/presenntation/auth/complete_profile/complete_profile.dart'
    as _i1;
import 'package:smartpay/presenntation/auth/complete_profile/confirmation.dart'
    as _i2;
import 'package:smartpay/presenntation/auth/otp_auth/otp_auth.dart' as _i6;
import 'package:smartpay/presenntation/auth/pin/pin_screen.dart' as _i3;
import 'package:smartpay/presenntation/auth/pin/verify_pin_screen.dart' as _i10;
import 'package:smartpay/presenntation/auth/sign_In/sign_in.dart' as _i7;
import 'package:smartpay/presenntation/auth/sign_up/sign_up.dart' as _i8;
import 'package:smartpay/presenntation/dashboard/home_screen.dart' as _i4;
import 'package:smartpay/presenntation/onboarding/onboarding_index.dart' as _i5;
import 'package:smartpay/presenntation/splash/splash_screen.dart' as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CompleteProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteProfileRouteArgs>(
          orElse: () => const CompleteProfileRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CompleteProfileScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ConnfirmationRouten.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ConnfirmationScreenn(),
      );
    },
    CreatePinRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreatePinScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    OnBoardingIndexRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingIndexScreen(),
      );
    },
    OtpAuth.name: (routeData) {
      final args =
          routeData.argsAs<OtpAuthArgs>(orElse: () => const OtpAuthArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OtpAuth(
          key: args.key,
          email: args.email,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
    VerifyPinRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.VerifyPinScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CompleteProfileScreen]
class CompleteProfileRoute
    extends _i11.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i12.Key? key,
    String? email,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CompleteProfileRoute.name,
          args: CompleteProfileRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CompleteProfileRoute';

  static const _i11.PageInfo<CompleteProfileRouteArgs> page =
      _i11.PageInfo<CompleteProfileRouteArgs>(name);
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({
    this.key,
    this.email,
  });

  final _i12.Key? key;

  final String? email;

  @override
  String toString() {
    return 'CompleteProfileRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i2.ConnfirmationScreenn]
class ConnfirmationRouten extends _i11.PageRouteInfo<void> {
  const ConnfirmationRouten({List<_i11.PageRouteInfo>? children})
      : super(
          ConnfirmationRouten.name,
          initialChildren: children,
        );

  static const String name = 'ConnfirmationRouten';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreatePinScreen]
class CreatePinRoute extends _i11.PageRouteInfo<void> {
  const CreatePinRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreatePinRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnBoardingIndexScreen]
class OnBoardingIndexRoute extends _i11.PageRouteInfo<void> {
  const OnBoardingIndexRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardingIndexRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingIndexRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OtpAuth]
class OtpAuth extends _i11.PageRouteInfo<OtpAuthArgs> {
  OtpAuth({
    _i12.Key? key,
    String? email,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OtpAuth.name,
          args: OtpAuthArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpAuth';

  static const _i11.PageInfo<OtpAuthArgs> page =
      _i11.PageInfo<OtpAuthArgs>(name);
}

class OtpAuthArgs {
  const OtpAuthArgs({
    this.key,
    this.email,
  });

  final _i12.Key? key;

  final String? email;

  @override
  String toString() {
    return 'OtpAuthArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i7.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.VerifyPinScreen]
class VerifyPinRoute extends _i11.PageRouteInfo<void> {
  const VerifyPinRoute({List<_i11.PageRouteInfo>? children})
      : super(
          VerifyPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPinRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
