import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smartpay/injectable.dart';
import 'package:smartpay/presenntation/core/font.dart';
import 'package:stacked/stacked.dart';

import '../../application/home/home_view_model.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
        onViewModelReady: (h) {
          h.setInitialised(true);
          h.getSecretFromPrefs();
        },
        viewModelBuilder: () => getIt<HomeViewModel>(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(20.0),
                  colors: [
                    Colors.cyan,
                    Color.fromARGB(255, 76, 150, 175),
                    Colors.blue,
                    Colors.indigo,
                    Colors.purple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 0.4, 0.25, 0.5, 0.9],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 35.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GFShimmer(
                              child: Container(
                                height: 36.h,
                                width: 110.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkResponse(
                                    onTap: () {},
                                    child: Container(
                                      height: 44.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0.w),
                                        child: Image.asset(
                                          scale:
                                              size.height >= 1232.0 ? 1 : 2.5,
                                          height: 22.h,
                                          "assets/images/png/Service.png",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkResponse(
                                    onTap: () {},
                                    child: Container(
                                      height: 44.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Icon(
                                            Icons.notifications_none_rounded,
                                            size: 30.h),
                                      ),
                                    ),
                                  ),
                                  InkResponse(
                                    onTap: () {},
                                    child: Container(
                                      height: 44.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Icon(Icons.people_rounded,
                                            size: 30.h),
                                      ),
                                    ),
                                  ),
                                ]),
                          ]),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: size.height >= 1232.0 ? 240.h : 236.h,
                      width: size.width * 0.90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 15, 28, 64),
                            Color.fromARGB(255, 28, 56, 236),
                          ],
                          stops: [0.25, 0.8],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: Text(
                          '${model.appSecret}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Font.sfPro,
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
                label: Text('Logout'),
                onPressed: () {
                  model.logout();
                }),
          );
        });
  }
}
