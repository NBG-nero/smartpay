import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            durationInMilliseconds: 1000,
            page: SplashRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
          page: OnBoardingIndexRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: SignInRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: SignUpRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: OtpAuth.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: CompleteProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: CreatePinRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: ConnfirmationRouten.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
         CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
         CustomRoute(
          page: VerifyPinRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        )
      ];
}
