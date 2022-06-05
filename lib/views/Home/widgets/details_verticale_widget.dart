import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class DetailsVerticaleWidget extends StatelessWidget {
  const DetailsVerticaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: 390.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: klightGreenColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 81.h,
            width: 80.w,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              color: klightGreynColor,
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              child: Image.asset(
                "assets/images/contact2.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "محمود ايمن السعيد",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FittedBox(
                              child: Icon(
                            Icons.access_time,
                            color: kGreyColor,
                          )),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "منذ ساعه",
                            style: GoogleFonts.tajawal(
                              color: kGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 1,
                      color: kGreyColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        "لو سمحت السياره ايش حالتها وهل تم عمل صيانه لها من قبل ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.tajawal(
                          color: kGreyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
