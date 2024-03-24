import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/presenntation/app_router/app_router.gr.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/core/validators/auth_validator.dart';
import '../../../injectable.dart';
import '../../app_router/app_router.dart';
import '../../core/font.dart';
import '../../general_widgets/app_back_button.dart';
import '../../general_widgets/custom_button.dart';
import '../../general_widgets/custom_textfield.dart';
import '../../general_widgets/social_buttons.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = true;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => getIt<AuthViewModel>(),
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    Text.rich(
                      TextSpan(
                          text: "Create a ",
                          children: [
                            TextSpan(
                                text: "Smartpay ",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                            const TextSpan(text: "\naccount")
                          ],
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: Font.sfPro,
                          )),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFieldWidget(
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        hintText: "Email",
                        controller: emailController,
                        validator: (val) => SmartPayValidator().isEmail(val),
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Font.sfPro,
                            color: const Color(0xFF9CA3AF))),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                        borderRadius: BorderRadius.circular(16.r),
                        height: 60.h,
                        bgColor: const Color(0xFF111827),
                        onPressed: isButtonActive
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  model.getEmailToken(
                                      email: emailController.text);
                                }
                                // getIt<AppRouter>().push(const OtpAuth());
                              }
                            : null,
                        child: model.isBusy
                            ? const CircularProgressIndicator.adaptive()
                            : Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Font.sfPro,
                                    color: Colors.white))),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/png/line.png"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          child: Text("OR",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: Font.sfPro,
                                  color: const Color(0xFF6B7280))),
                        ),
                        RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset("assets/images/png/line.png")),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const SocialButtons(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {
                        getIt<AppRouter>().push(const SignInRoute());
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                          style: TextStyle(
                              color: const Color(0xFF6B7280),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
