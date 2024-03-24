import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/presenntation/app_router/app_router.dart';

import '../../injectable.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<AppRouter>().pop();
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(12.r)),
        child: Image.asset("assets/images/png/arrow_back.png"),
      ),
    );
  }
}
