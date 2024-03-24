import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/domain/core/validators/auth_validator.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:smartpay/presenntation/app_router/app_router.gr.dart';
import 'package:smartpay/presenntation/general_widgets/custom_button.dart';
import 'package:smartpay/presenntation/general_widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

import '../../../injectable.dart';
import '../../app_router/app_router.dart';
import '../../core/font.dart';
import '../../general_widgets/app_back_button.dart';
import '../../general_widgets/social_buttons.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => getIt<AuthViewModel>(),
        onViewModelReady: (a) {},
        builder: (context, model, child) {
          return Scaffold(
              // appBar: AppBar(

              // ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    const AppBackButton(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Hi There! 👋",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: Font.sfPro,
                      ),
                    ),
                    Text(
                      "Welcome back, Sign in to your account",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: Font.sfPro,
                          color: const Color(0xFf6B7280)),
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
                    CustomTextFieldWidget(
                      filled: true,
                      fillColor: const Color(0xFFF9FAFB),
                      hintText: "Password",
                      controller: passwordController,
                      validator: (val) => SmartPayValidator().password(val),
                      obscureText: model.obscurePassword,
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: Font.sfPro,
                          color: const Color(0xFF9CA3AF)),
                      suffix: Image.asset("assets/images/png/password_eye.png"),
                      suffixAction: () {
                        model.togglePassword();
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 10.h,
                    ),
                    Text("Forgot Password?",
                        style: TextStyle(
                            color: const Color(0xFF0A6375),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600)),
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
                                model.login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            }
                          : null,
                      child: model.isBusy
                          ? const CircularProgressIndicator.adaptive()
                          : Text("Sign In",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: Font.sfPro,
                                  color: Colors.white)),
                    ),
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
                    SizedBox(height: 80.h),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.loose,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              getIt<AppRouter>().push(const SignUpRoute());
                            },
                            child: Text.rich(
                              TextSpan(
                                  text: "Don’t have an account? ",
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16.sp,
                                          fontFamily: Font.sfPro,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ]),
                              style: TextStyle(
                                  color: const Color(0xFF6B7280),
                                  fontSize: 16.sp,
                                  fontFamily: Font.sfPro,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
