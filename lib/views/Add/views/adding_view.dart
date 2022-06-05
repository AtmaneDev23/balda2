import 'package:balda2/views/Add/widgets/first_add_widget.dart';
import 'package:balda2/views/Add/widgets/forth_add_widget.dart';
import 'package:balda2/views/Add/widgets/second_add_widget.dart';
import 'package:balda2/views/Add/widgets/third_add_widget.dart';
import 'package:balda2/views/settings/widgets/first_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../common/large_buton_icon.dart';
import '../../../constants.dart';

class AddingView extends StatefulWidget {
  const AddingView({Key? key}) : super(key: key);
  static const String routeName = '/adding_view';

  @override
  State<AddingView> createState() => _AddingViewState();
}

class _AddingViewState extends State<AddingView> {
  int _width = 1;
  final bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 303.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(32, 127, 201, 1),
                      kprimaryColor,
                    ],
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
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
                      SizedBox(width: 122.w),
                      Text(
                        "إضافه اعلان",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "ستتمكّن من بيع وشراء أي شيئ ممكن أن تتخيله",
                    style: GoogleFonts.tajawal(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "1 / 4",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 379.w,
                    child: Stack(
                      children: [
                        Container(
                          height: 5.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: const Color.fromRGBO(237, 237, 237, 0.5),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 5.h,
                          width: (379.w / 4) * _width,
                          constraints: BoxConstraints(maxWidth: 379.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: _width == 1
                    ? const FirstAddWidget()
                    : _width == 2
                        ? const SecondAdWidget()
                        : _width == 3
                            ? const ThirdAddView()
                            : const ForthAddWidget(),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    _width < 3
                        ? setState(() {
                            _width = _width + 1;
                          })
                        : showMaterialModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              height: 506.h,
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(31.r),
                                  topRight: Radius.circular(31.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 350.h,
                                    child: Center(
                                      child: Stack(children: [
                                        Center(
                                          child: SvgPicture.asset(
                                            "assets/images/empty_add_back.svg",
                                            height: 350.h,
                                          ),
                                        ),
                                        Center(
                                          child: SvgPicture.asset(
                                            "assets/images/speaker.svg",
                                            height: 200.h,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                  Center(
                                    child: Text(
                                      "تم انشاء اعلانك بنجاح",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 22.sp,
                                        color: kprimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17.h),
                                  Center(
                                    child: Text(
                                      " اذهب الي اعلاناتي لمتابعت اعلانك",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).then((value) {
                            Navigator.pop(context);
                          });
                  },
                  child: LargeButtonIcon(
                    isFinal: _width > 3 ? true : false,
                    name: _width > 3 ? "انشاء الاعلان" : "متابعه",
                  )),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
