import 'package:balda2/common/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class ChangeUserView extends StatefulWidget {
  const ChangeUserView({Key? key}) : super(key: key);
  static const String routeName = '/change_user';

  @override
  State<ChangeUserView> createState() => _ChangeUserViewState();
}

class _ChangeUserViewState extends State<ChangeUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
          height: 326.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 127, 201, 1),
              kprimaryColor,
            ],
          )),
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 27.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: const FittedBox(
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 100.w),
              Text(
                "تعديل اسم المستخدم",
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 798.h,
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r)),
              ),
              child: Column(
                children: [
                  Container(
                    //height: 95.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    decoration: const BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(color: klightGreynColor, width: 1),
                        // ),
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الاسم الاول",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            color: kprimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 11.h),
                        TextField(
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: klightGreynColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: klightGreenColor),
                            ),
                            hintText: "احمد",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 18.sp,
                              color: kGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Container(
                    //height: 95.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    decoration: const BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(color: klightGreynColor, width: 1),
                        // ),
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الاسم الاخير",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            color: kprimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 11.h),
                        TextField(
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: klightGreynColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: klightGreenColor),
                            ),
                            hintText: "محمد",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 18.sp,
                              color: kGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 330.h,
                        ),
                        Center(
                          child: LargeButton(
                              height: 53.h,
                              width: 350.w,
                              color: kprimaryColor,
                              name: "حفظ"),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
