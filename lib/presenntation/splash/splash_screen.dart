import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/application/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../injectable.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => getIt<SplashViewModel>(),
      onViewModelReady: (h) {
        h.timedNavigate();
      },
      builder: (context, model, child) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/png/logo.png",
              scale: 2,
            ),
          )
        ],
      )),
    );
  }
}
