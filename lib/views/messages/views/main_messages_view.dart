import 'package:balda2/views/messages/views/chat_view.dart';
import 'package:balda2/views/messages/widgets/messages_widget.dart';
import 'package:flutter/material.dart';
import 'package:balda2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMessagesView extends StatefulWidget {
  const MainMessagesView({Key? key}) : super(key: key);
  static const String routeName = '/messages';

  @override
  State<MainMessagesView> createState() => _MainMessagesViewState();
}

class _MainMessagesViewState extends State<MainMessagesView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundgreyColor,
      body: Stack(
        children: [
          Container(
            height: 272.h,
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
                height: 52.h,
              ),
              Container(
                //height: 24.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "assets/icons/heart.png",
                        height: 20.h,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "رسائل",
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/icons/bell.png",
                        height: 25.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    "رسائل",
                    style: GoogleFonts.tajawal(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 19.h,
                    //width: 49.w,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        "23",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: kGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 189.h,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 6,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 14.h,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(ChatView.routeName);
                          },
                          child: const MessagesWidget());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
