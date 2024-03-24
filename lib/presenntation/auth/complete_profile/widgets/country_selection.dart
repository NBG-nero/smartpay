// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/application/profile/profile_view_model.dart';

import '../../../core/font.dart';
import '../../../general_widgets/custom_textfield.dart';
import '../models/country.dart';

class CountrySelection extends StatefulWidget {
  // const CountrySelection({
  //   super.key,
  // });
  final ProfileViewModel? model;

  const CountrySelection({super.key, this.model});
  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      height: MediaQuery.of(context).size.height * 0.73,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  flex: 3,
                  child: CustomTextFieldWidget(
                    prefix: SvgPicture.asset("assets/images/svgs/search.svg"),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFf6B7280)),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: Font.sfPro)),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
              ],
            ),
            Expanded(
              // height: 100.h,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfCountries.length,
                  itemBuilder: (context, index) {
                    Country country = listOfCountries[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0.w, horizontal: 5.w),
                      child: Container(
                        color: currentIndex == index
                            ? const Color(0xFFF9FAFB)
                            : Colors.transparent,
                        alignment: Alignment.center,
                        height: 70.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                            widget.model!.selectCountry(country: country);
                            AutoRouter.of(context)
                                .pop(widget.model!.selectedCountry);
                          },
                          child: CountryTile(
                              country: country,
                              // currentIndex: currentIndex,
                              isSelected: currentIndex == index),
                        ),
                      ),
                    );
                  }),
            )
          ])),
    );
  }
}

class CountryTile extends StatefulWidget {
  CountryTile({
    super.key,
    required this.country,
    // required this.currentIndex,
    this.isSelected = false,
  });

  final Country country;
  // final int currentIndex;
  bool isSelected;

  @override
  State<CountryTile> createState() => _CountryTileState();
}

class _CountryTileState extends State<CountryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(widget.country.flagUrl ?? ""),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Text(widget.country.initials ?? "",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: Font.sfPro,
                        color: const Color(0xFF6B7280))),
              ),
              Text(widget.country.name ?? "",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Font.sfPro,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111827)))
            ],
          ),
          widget.isSelected
              ? SvgPicture.asset("assets/images/svgs/country_check.svg")
              : Container()
        ],
      ),
    );
  }
}
