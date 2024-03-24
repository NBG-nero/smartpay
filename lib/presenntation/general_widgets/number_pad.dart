import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/font.dart';

class NumPad extends StatelessWidget {
  final void Function({String? number, bool isDelete}) onTap;
  final bool showExtraField;
  const NumPad({Key? key, required this.onTap, this.showExtraField = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberButton(number: '1', onTap: onTap),
              NumberButton(number: '2', onTap: onTap),
              NumberButton(number: '3', onTap: onTap),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberButton(number: '4', onTap: onTap),
              NumberButton(number: '5', onTap: onTap),
              NumberButton(number: '6', onTap: onTap),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberButton(number: '7', onTap: onTap),
              NumberButton(number: '8', onTap: onTap),
              NumberButton(number: '9', onTap: onTap),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showExtraField
                  ? NumberButton(
                      onTap: onTap,
                      number: '*',
                    )
                  : SizedBox(
                      width: 96.0.w,
                      height: 50.0.h,
                    ),
              NumberButton(number: '0', onTap: onTap),
              Container(
                width: 96.0.w,
                height: 50.0.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.transparent)),
                child: IconButton(
                  onPressed: () => onTap(isDelete: true),
                  icon: SvgPicture.asset(
                    'assets/images/svgs/keyboard_clear.svg',
                    height: 50.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String? number;
  final String? number0;
  final void Function({
    String number,
    bool isDelete,
  }) onTap;
  const NumberButton({Key? key, this.number, required this.onTap, this.number0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.0.w,
      height: 50.0.h,
      child: InkResponse(
        onTap: () {
          onTap(number: number?.toString() ?? number0!,
          //  isDelete: false
           );
          // if (number != null) {
          //   onTap(number: number!, isDelete: false);
          // } else if (number0 != null) {
          //   onTap(number: number0!, isDelete: false);
          // }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            color: Colors.transparent,
          ),
          child: Center(
            child: Text(
              number?.toString() ?? '00',
              style: TextStyle(
                fontFamily: Font.sfPro,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
