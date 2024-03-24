import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:smartpay/presenntation/app_router/app_router.gr.dart';

import '../../../injectable.dart';
import '../../app_router/app_router.dart';
import '../../core/font.dart';
import '../../general_widgets/custom_button.dart';

@RoutePage()
class ConnfirmationScreenn extends StatelessWidget {
  const ConnfirmationScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.2,
              // ),
              Image.asset(
                "assets/images/png/thumbs_up.png",
                scale: 1.5,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              Text("Congratulations, James",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: Font.sfPro,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111827))),
              SizedBox(height: 10.h),
              Text("You’ve completed the onboarding, \nyou can start using",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Font.sfPro,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF6B7280))),
              SizedBox(height: 30.h),
              CustomButton(
                // onPressed: () {},
                height: 60.h,
                bgColor: const Color(0xFF111827),
                onPressed: () {
                  getIt<AppRouter>().push(const SignInRoute());
                },
                child: Text("Get Started",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: Font.sfPro,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
