import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeVerticaleWidget extends StatefulWidget {
  const HomeVerticaleWidget({
    Key? key,
    required this.imagePath,
    required this.isFavorite,
    required this.createdAt,
    required this.username,
    required this.city,
    required this.catrgory,
    required this.discription,
    required this.rate,
  }) : super(key: key);
  final String imagePath;
  final bool isFavorite;
  final String createdAt;
  final String username;
  final String city;
  final String catrgory;
  final String discription;
  final String rate;

  @override
  State<HomeVerticaleWidget> createState() => _HomeVerticaleWidgetState();
}

class _HomeVerticaleWidgetState extends State<HomeVerticaleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      height: 297.h,
      width: 384.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 1,
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 5),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 204.h,
            width: 368.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              color: kprimaryColor,
            ),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.imagePath,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SvgPicture.asset(
                        "assets/icons/contact_placeholder.svg",
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        "assets/icons/contact_placeholder.svg",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 31.h,
                        width: 31.w,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.isFavorite == !widget.isFavorite;
                            });
                          },
                          child: Center(
                            child: Icon(
                              widget.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: kprimaryColor,
                              size: 20.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Container(
                        height: 31.h,
                        width: 31.w,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Center(
                            child: Icon(
                              widget.isFavorite
                                  ? Icons.star
                                  : Icons.star_outline,
                              color: Colors.amber,
                              size: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.discription,
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: kprimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 21.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(34, 76, 92, 145),
                      borderRadius: BorderRadius.circular(13.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                          child: Icon(
                        Icons.access_time,
                        color: Color.fromRGBO(77, 77, 77, 1),
                      )),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        widget.createdAt,
                        style: GoogleFonts.tajawal(
                          color: const Color.fromRGBO(77, 77, 77, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.5.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/man.svg"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      widget.username,
                      style: GoogleFonts.tajawal(
                        color: kprimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 42.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/location.svg"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      widget.city,
                      style: GoogleFonts.tajawal(
                        color: kprimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 42.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/car.svg"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      widget.catrgory,
                      style: GoogleFonts.tajawal(
                        color: kprimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
