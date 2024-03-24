import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/presenntation/general_widgets/custom_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          width: 155.w,
          height: 60.h,
          bgColor: Colors.transparent,
          onPressed: () {},
          borderColor: Colors.grey,
          child: SvgPicture.asset("assets/images/svgs/google_icon.svg"),
        ),
        CustomButton(
          width: 155.w,
          height: 60.h,
          bgColor: Colors.transparent,
          onPressed: () {},
          borderColor: Colors.grey,
          child: SvgPicture.asset("assets/images/svgs/apple_logo.svg"),
        ),
      ],
    );
  }
}
