import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/presenntation/auth/otp_auth/animation/timer_animation.dart';
import 'package:smartpay/presenntation/general_widgets/custom_button.dart';
import 'package:smartpay/presenntation/general_widgets/number_pad.dart';
import 'package:stacked/stacked.dart';

import '../../../injectable.dart';
import '../../core/font.dart';
import '../../general_widgets/app_back_button.dart';
import '../../general_widgets/app_pin_code_textfield.dart';
// import '../complete_profile/complete_profile.dart';

@RoutePage()
class OtpAuth extends StatefulWidget {
  const OtpAuth({super.key, this.email});
  final String? email;

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  String pin = "";
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  bool isButtonActive = false;
  final formKey = GlobalKey<FormState>();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  @override
  Widget build(BuildContext context) {
    // OtpFieldController otpController = OtpFieldController();
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => getIt<AuthViewModel>(),
      builder: (context, model, child) => Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            onChanged: () {
              setState(() {
                isButtonActive = formKey.currentState?.validate() ?? false;
              });
            },
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
                Text("Verify it’s you",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: Font.sfPro,
                    )),
                Text.rich(
                  TextSpan(
                      text: "We send a code to",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: Font.sfPro,
                          color: const Color(0xFF6B7280)),
                      children: [
                        TextSpan(
                            text: " ${widget.email}.",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: Font.sfPro,
                                color: Colors.black)),
                        const TextSpan(
                            text: " Enter it here to verify your identity")
                      ]),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppPinCodeTextField(
                    errorController: errorController,
                    textEditingController: textEditingController),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  child: TimerAnimation(
                    authViewModel: model,
                  )
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(16.r),
                  height: 60.h,
                  bgColor: const Color(0xFF111827),
                  onPressed: isButtonActive
                      ? () {
                          if (formKey.currentState!.validate()) {
                            model.verifyEmailToken(
                                email: widget.email ?? "",
                                token: textEditingController.text);
                          }

                          // getIt<AppRouter>().push(const CompleteProfileRoute());
                        }
                      : null,
                  child: model.isBusy
                      ? const CircularProgressIndicator.adaptive()
                      : Text("Confirm",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: Font.sfPro,
                              color: Colors.white)),
                ),
                SizedBox(
                  height: 10.h,
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
                   
                    } else if(pin.length< 5){
                      setState(() {
                        pin = pin + number.toString();
                        textEditingController.text = pin;
                      });
                    }
                  })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
