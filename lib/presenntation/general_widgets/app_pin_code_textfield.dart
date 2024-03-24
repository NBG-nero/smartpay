import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinCodeTextField extends StatelessWidget {
  const AppPinCodeTextField({
    super.key,
    required this.errorController,
    required this.textEditingController,
    this.pinType,
    this.onCompleted,
  });

  final StreamController<ErrorAnimationType>? errorController;
  final TextEditingController textEditingController;
  final PinCodeFieldShape? pinType;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      backgroundColor: const Color(0xFFF9FAFB),
      pastedTextStyle: const TextStyle(
        color: Colors.transparent,
        fontWeight: FontWeight.bold,
      ),
      length: 5,
      obscureText: true,
      obscuringCharacter: '●',
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 3) {
          return "Please fill all fields";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
          shape: pinType ?? PinCodeFieldShape.box,
          borderRadius: pinType == PinCodeFieldShape.box
              ? BorderRadius.circular(15.r)
              : null,
          fieldHeight: 64.h,
          fieldWidth: 60.w,
          borderWidth: 0.0.w,
          selectedBorderWidth: 0.5.w,
          activeBorderWidth: 0.5.w,
          selectedColor: Theme.of(context).primaryColor,
          selectedFillColor: const Color(0xFFF9FAFB),
          inactiveColor: const Color(0xFFF9FAFB),
          inactiveFillColor: Colors.transparent,
          activeFillColor: const Color(0xFFF9FAFB),
          activeColor: Theme.of(context).primaryColor),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: 
      onCompleted ??
      (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
