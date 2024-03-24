import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/application/auth/auth_view_model.dart';
import 'package:smartpay/application/profile/profile_view_model.dart';
import 'package:smartpay/domain/core/validators/auth_validator.dart';
import 'package:smartpay/presenntation/auth/complete_profile/widgets/country_selection.dart';
import 'package:stacked/stacked.dart';

import '../../../injectable.dart';
import '../../core/font.dart';
import '../../general_widgets/app_back_button.dart';
import '../../general_widgets/custom_button.dart';
import '../../general_widgets/custom_textfield.dart';

@RoutePage()
class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key, this.email});
  final String? email;

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  final AuthViewModel _authViewModel = getIt<AuthViewModel>();
  //  TextEditingController fullname = TextEditingController();

  //   TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => getIt<ProfileViewModel>(),
        onViewModelReady: (h) {},
        builder: (context, model, child) {
          return Scaffold(
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
                      Text.rich(TextSpan(
                          text: "Hey there! tell us a bit \nabout ",
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text: "yourself",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor))
                          ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFieldWidget(
                          filled: true,
                          fillColor: const Color(0xFFF9FAFB),
                          hintText: "Full Name",
                          controller: fullname,
                          validator: (val) => SmartPayValidator().fullName(val),
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
                          hintText: "Username",
                          controller: username,
                          validator: (val) => SmartPayValidator().userName(val),
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: Font.sfPro,
                              color: const Color(0xFF9CA3AF))),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isDismissible: true,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              builder: (context) {
                                return CountrySelection(model: model);
                              });
                        },
                        child: Container(
                          height: 70.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: model.selectedCountry == null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Select Country",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: Font.sfPro,
                                              color: const Color(0xFF9CA3AF))),
                                      SvgPicture.asset(
                                          "assets/images/svgs/chevron-bottom.svg")
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              model.selectedCountry!.flagUrl ??
                                                  ""),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            model.selectedCountry!.name ?? "",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: Font.sfPro,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF111827)),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/svgs/chevron-bottom.svg")
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFieldWidget(
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        hintText: "Password",
                        controller: password,
                        validator: (val) => SmartPayValidator().password(val),
                        obscureText: model.obscurePassword,
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Font.sfPro,
                            color: const Color(0xFF9CA3AF)),
                        suffix:
                            Image.asset("assets/images/png/password_eye.png"),
                        suffixAction: () => model.togglePassword(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        borderRadius: BorderRadius.circular(16.r),
                        height: 60.h,
                        bgColor: const Color(0xFF111827),
                        // onPressed: () {
                        //   getIt<AppRouter>().push(const CreatePinRoute());
                        // }
                        onPressed: isButtonActive
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  _authViewModel.register(
                                      fullname: fullname.text,
                                      username: username.text,
                                      email: widget.email ?? "",
                                      country:
                                          model.selectedCountry?.initials ?? "",
                                      password: password.text);
                                  // model.verifyEmailToken(
                                  //     email: widget.email ?? "",
                                  //     token: textEditingController.text);
                                }

                                // getIt<AppRouter>().push(const CompleteProfileRoute());
                              }
                            : null,
                        child: getIt<AuthViewModel>().isBusy
                            ? const CircularProgressIndicator.adaptive()
                            : Text("Continue",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Font.sfPro,
                                    color: Colors.white)),
                      ),
                    ]),
              ),
            ),
          ));
        });
  }
}
