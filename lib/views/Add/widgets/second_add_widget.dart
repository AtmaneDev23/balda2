import 'package:balda2/constants.dart';
import 'package:balda2/views/Add/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SecondAdWidget extends StatefulWidget {
  const SecondAdWidget({Key? key}) : super(key: key);

  @override
  State<SecondAdWidget> createState() => _SecondAdWidgetState();
}

class _SecondAdWidgetState extends State<SecondAdWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 23.h,
            ),
            Text(
              "وش حابب تريد بيعه ؟",
              style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: kprimaryColor,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),

              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14.w,
                mainAxisSpacing: 18.h,
                children: const [
                  GridWidget(name: "السيارات", isSelected: true),
                  GridWidget(name: "عقارات", isSelected: false),
                  GridWidget(name: "اجهزه منزليه", isSelected: false),
                  GridWidget(name: "هواتف", isSelected: false),
                  GridWidget(name: "اثاث منزل", isSelected: false),
                  GridWidget(name: "الموضه", isSelected: false),
                  GridWidget(name: "حيوانات", isSelected: false),
                  GridWidget(name: "رياضه", isSelected: false),
                  GridWidget(name: "العاب اطفال", isSelected: false),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
