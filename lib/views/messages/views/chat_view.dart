import 'package:balda2/views/messages/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/large_button.dart';
import '../../../constants.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);
  static const String routeName = '/chat_view';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<Message> messages = [
    Message(
      content: "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على",
      date: "11 Nov 2008",
      isSent: false,
    ),
    Message(
        content: "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على",
        date: "11 Nov 2008",
        isSent: true),
    Message(
        content: "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على",
        date: "11 Nov 2008",
        isSent: false),
    Message(
        content: "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على",
        date: "11 Nov 2008",
        isSent: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(32, 127, 201, 1),
            kprimaryColor,
          ],
        )),
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
            height: 150.h,
            decoration: const BoxDecoration(),
            width: double.infinity,
            child: GestureDetector(
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kbackgroundgreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31.r),
                  topRight: Radius.circular(31.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      //height: 800.h,
                      padding: EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                        color: kbackgroundgreyColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(31.r),
                          topRight: Radius.circular(31.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 11.h),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 17.w,
                                    ),
                                    Text(
                                      "للبيع" ":",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14.sp,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "مرسيدس شبح 320S لارج امريكي",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14.sp,
                                        color: kprimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  right: 20.w, left: 20.w, top: 20.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(31.r),
                                  topRight: Radius.circular(31.r),
                                ),
                              ),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: messages.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 13.h,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Align(
                                    alignment: messages[index].isSent
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    child: ChatWidget(
                                      isSent: messages[index].isSent,
                                      message: messages[index].content,
                                      date: messages[index].date,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Message {
  final String content;
  final String date;
  final bool isSent;

  Message({required this.content, required this.date, required this.isSent});
}
