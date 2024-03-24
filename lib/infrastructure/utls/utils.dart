import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

errorDialog(
  BuildContext context, {
  required String message,
  String? dialogType,
  String? iconName,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                // Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(top: 70),
                  // child: Icon(Icons.cancel),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width - 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.cancel))),
                    Icon(
                      Icons.warning_amber,
                      size: 20.h,
                    ),
                    Text(
                      dialogType ?? " An Error Occurred",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                // Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(top: 70),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
