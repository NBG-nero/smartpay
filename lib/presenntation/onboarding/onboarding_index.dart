import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/presenntation/app_router/app_router.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../injectable.dart';
import '../app_router/app_router.dart';
import '../core/font.dart';
import '../general_widgets/custom_button.dart';

@RoutePage()
class OnBoardingIndexScreen extends StatefulWidget {
  const OnBoardingIndexScreen({super.key});

  @override
  State<OnBoardingIndexScreen> createState() => _OnBoardingIndexScreenState();
}

class _OnBoardingIndexScreenState extends State<OnBoardingIndexScreen> {
  final PageController pageController = PageController(viewportFraction: 1);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {
              getIt<AppRouter>().replace(const SignInRoute());
            },
            child: Align(
                alignment: Alignment.topRight,
                child: Text("Skip",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Font.sfPro,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600))),
          ),
          Expanded(
            child: PageView(
                padEnds: false,
                controller: pageController,
                children: [
                  OnboardingPageOne(size: size),
                  OnboardingPageTwo(size: size)
                ]),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 2,
            effect: ExpandingDotsEffect(
              spacing: 10.0,
              radius: 5.0,
              dotWidth: 16.0.h,
              dotHeight: 8.0.h,
              dotColor: const Color(0xffE5E7EB),
              paintStyle: PaintingStyle.fill,
              strokeWidth: 0.5,
              activeDotColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
              height: 60.h,
              width: 287.w,
              borderRadius: BorderRadius.circular(16.r),
              bgColor: const Color(0xFF111827),
              onPressed: () {
                getIt<AppRouter>().replace(const SignInRoute());
              },
              child: Text("Get Started",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: Font.sfPro,
                      color: Colors.white)))
        ],
      ),
    ));
  }
}

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: 80.h,
              bottom: 20.h,
              left: 0.0,
              right: 0.0,
              child: Image.asset("assets/images/png/device1.png", scale: 2.1),
            ),
            Positioned(
                right: 0.0,
                top: 220.h,
                child:
                    Image.asset("assets/images/png/sideMenu.png", scale: 2.2)),
            Positioned(
                left: 40.0.h,
                top: 310.h,
                child: Image.asset(
                  "assets/images/png/direct_deposit.png",
                  scale: 2.2,
                )),
            Positioned(
                left: 44.0.h,
                top: 110.h,
                child: Image.asset(
                  "assets/images/png/security.png",
                  scale: 1.0,
                )),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: size.height * 0.28,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Finance app the safest \n and most trusted",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: Font.sfPro,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          "Your finance work starts here. Our here to help you track and deal with speeding up your \n transactions.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: Font.sfPro,
                              color: const Color(0xFF6B7280)))
                    ],
                  ),
                )),
          ],
        ));
  }
}

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: 80.h,
              bottom: 20.h,
              left: 0.0,
              right: 0.0,
              child: Image.asset("assets/images/png/device2.png", scale: 2.1),
            ),
            Positioned(
                right: 30.0,
                top: 260.h,
                child:
                    Image.asset("assets/images/png/contact.png", scale: 2.2)),
            Positioned(
                left: 40.0.h,
                top: 182.h,
                child: Image.asset(
                  "assets/images/png/onnboarding2left.png",
                  scale: 2.2,
                )),
            // Positioned(
            //     left: 44.0.h,
            //     top: 110.h,
            //     child: Image.asset(
            //       "assets/images/png/security.png",
            //       scale: 1.0,
            //     )),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: size.height * 0.28,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("The fastest transaction \n process only here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: Font.sfPro,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          "Get easy to pay all your bills with just a few steps. Paying your bills become fast and \n efficient.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: Font.sfPro,
                              color: const Color(0xFF6B7280)))
                    ],
                  ),
                )),
          ],
        ));
  }
}
