import 'package:flutter/material.dart';
import 'package:balda2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdCircleWidget extends StatelessWidget {
  const AdCircleWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: 53,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(style: BorderStyle.solid, color: kprimaryColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.r),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.fill,
          placeholder: (context, url) => SvgPicture.asset(
            "assets/icons/contact_placeholder.svg",
          ),
          errorWidget: (context, url, error) => SvgPicture.asset(
            "assets/icons/contact_placeholder.svg",
          ),
        ),
      ),
    );
  }
}
