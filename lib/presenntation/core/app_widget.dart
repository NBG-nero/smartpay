import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../infrastructure/core/dialog_service.dart';
import '../../injectable.dart';
import '../app_router/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final _appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        key: getIt<DialogService>().dialogNavigatorKey,
        title: 'Smartpay',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF2FA2B9)),
            useMaterial3: true,
            primaryColor: const Color(0xFF2FA2B9)),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
