import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/presenntation/core/font.dart';
import 'package:smartpay/presenntation/general_widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../injectable.dart';
import '../../general_widgets/app_back_button.dart';
import '../../general_widgets/app_pin_code_textfield.dart';
import '../../general_widgets/number_pad.dart';

@RoutePage()
class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => getIt<AuthViewModel>(),
        onViewModelReady: (a) {
          a.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  const AppBackButton(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Text("Enter your PIN code",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: Font.sfPro)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Text(
                  //     "We use state-of-the-art security measures to protect your information at all times",
                  //     style: TextStyle(
                  //         fontSize: 16.sp,
                  //         color: const Color(0xFF6B7280),
                  //         fontWeight: FontWeight.w400,
                  //         fontFamily: Font.sfPro)),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppPinCodeTextField(
                    errorController: errorController,
                    pinType: PinCodeFieldShape.underline,
                    textEditingController: textEditingController,
                    onCompleted: (value) {
                      model.verifyUserPin(value);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  CustomButton(
                    // onPressed: () {},
                    height: 60.h,
                    bgColor: const Color(0xFF111827),
                    onPressed: () {
                      model.verifyUserPin(pin);
                    },
                    child: Text("Verify Pin",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: Font.sfPro,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  NumPad(onTap: ({bool isDelete = false, String? number}) {
                    if (isDelete) {
                      setState(() {
                        if (pin.isNotEmpty) {
                          pin = pin.substring(0, pin.length - 1);
                          textEditingController.text = pin;
                          // otpController.set(pin)
                        }
                      });
                    } else if (pin.length < 5) {
                      setState(() {
                        pin = pin + number.toString();
                        textEditingController.text = pin;
                      });
                    }
                  })
                ],
              ),
            ),
          ));
        });
  }
}
