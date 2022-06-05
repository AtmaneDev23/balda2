import 'package:balda2/views/settings/views/raise_subscription.dart';
import 'package:balda2/views/settings/widgets/account_widget.dart';
import 'package:balda2/views/settings/widgets/subscription_raised.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants.dart';
import '../../../models/PublicModels/bank.dart';

class SecondSettingsViewWidget extends StatefulWidget {
  const SecondSettingsViewWidget({Key? key, required this.banks})
      : super(key: key);
  final List<Bank> banks;

  @override
  State<SecondSettingsViewWidget> createState() =>
      _SecondSettingsViewWidgetState();
}

class _SecondSettingsViewWidgetState extends State<SecondSettingsViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                //height: 38.h,
                width: 296.w,
                child: Center(
                  child: Text(
                    "العمولة أمانة في ذمة المعلن سواء تمت المبايعة عن طريق الموقع أو بسببه، وموضحة قيمتها بما يلي",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: kGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RaiseSubscription.routeName)
                      .then((value) {
                    showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const SubscriptionRaised(),
                    );
                  });
                },
                child: Container(
                  height: 40.h,
                  width: 156.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: Colors.transparent,
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(64, 172, 66, 1))),
                  child: Center(
                    child: Text(
                      "ترقيه الحساب",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: const Color.fromRGBO(64, 172, 66, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 163.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.banks.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 7.w,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return AccountWidget(
                      iban: widget.banks[index].ibanNbr,
                      accountNumber: widget.banks[index].accountNbr,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "ادخل سعر البيع",
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: kprimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 59.h,
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: klightGreynColor,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "110,000",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "ريال سعودي",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: kGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "العموله المستحقه",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(64, 172, 66, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "200 ريال سعودي",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(64, 172, 66, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
