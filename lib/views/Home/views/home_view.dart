import 'package:balda2/constants.dart';
import 'package:balda2/controllers/ads_controller.dart';
import 'package:balda2/helpers/user_provider.dart';
import 'package:balda2/models/AdsModels/paid_ad.dart';
import 'package:balda2/views/Home/views/category_view.dart';
import 'package:balda2/views/Home/widgets/add_ad_bottom_sheet.dart';
import 'package:balda2/views/Home/widgets/home_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../common/settings_model.dart';
import '../../../controllers/public_controller.dart';
import '../../../models/AdsModels/ad.dart';
import '../../../models/PublicModels/category.dart';
import '../widgets/ad_circle_widget.dart';
import '../widgets/home_verticale_widget.dart';
import 'ad_view.dart';
import 'package:provider/provider.dart';

import 'details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchText = TextEditingController();
  List<Category> _categories = [];
  List<Ad> _ads = [];
  List<PaidAd> _paidAds = [];

  void getAds() async {
    await AdsController.getAds(
      Provider.of<UserProvider>(context, listen: false).user.apiToken,
    ).then((value) {
      setState(() {
        _ads = value;
      });
    });
  }

  void searchAds(String key) async {
    await AdsController.searhAd(
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).user.apiToken,
      key,
    ).then((value) {
      if (mounted) {
        setState(() {
          _ads = value;
        });
      }
    });
  }

  void getCategories() async {
    await PublicContoller.getCategoties().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  void getPaidAds() async {
    await AdsController.getPaidAds(
      Provider.of<UserProvider>(context, listen: false).user.apiToken,
    ).then((value) {
      setState(() {
        _paidAds = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      getPaidAds();
      getCategories();
      getAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Container(
              //height: 170.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 52.h,
                bottom: 15.h,
                right: 20.w,
                left: 20.w,
              ),
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
                Row(
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
                        "بلدة معاكم اينما كنتم",
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
                // SizedBox(
                //   height: 10.h,
                // ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  //padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 42.h,
                  //width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 42.h,
                          //width: 320.w,
                          decoration: BoxDecoration(
                            color: kopacity,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 7.w,
                              ),
                              SvgPicture.asset("assets/icons/search.svg"),
                              SizedBox(
                                width: 14.w,
                              ),
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.search,
                                  controller: searchText,
                                  maxLines: 1,
                                  expands: false,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 15.sp, color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "بحث عن",
                                    hintStyle: TextStyle(color: Colors.white30),
                                  ),
                                  onSubmitted: (String key) async {
                                    searchAds(key);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          showMaterialModalBottomSheet<Map>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                const SettingsModelWidget(catID: ""),
                          ).then((value) {
                            setState(() {
                              if (value != null) {
                                _ads = value["adsList"];
                              }
                            });
                          });
                        },
                        child: Container(
                          height: 42.h,
                          width: 49.w,
                          decoration: BoxDecoration(
                            color: kopacity,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/settings2.svg",
                            height: 15.h,
                            width: 18.w,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 53.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const AddAdBottomSheet(),
                      );
                    },
                    child: DottedBorder(
                      color: kborderColor,
                      strokeCap: StrokeCap.butt,
                      strokeWidth: 1,
                      borderType: BorderType.Circle,
                      dashPattern: const [5, 5, 5, 5],
                      child: const SizedBox(
                        height: 53,
                        width: 53,
                        child: Icon(
                          Icons.add,
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 53.h,
                      //width: 360.w,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: _paidAds.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      const Color.fromRGBO(37, 40, 55, 0.9),
                                  builder: (context) => AdView(
                                    photoPath: _paidAds[index].photo,
                                    title: _paidAds[index].details,
                                    username: _paidAds[index].user.firstName,
                                    userPhotoPath: _paidAds[index].user.photo,
                                  ),
                                );
                              },
                              child: AdCircleWidget(
                                  imagePath: _paidAds[index].photo),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14.3.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 25.sp),
              alignment: Alignment.topRight,
              child: Text(
                "وش حاب تدور عليه ؟",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: kprimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 13.3.h,
            ),
            SizedBox(
                height: 118.h,
                child: ListView.separated(
                  padding: const EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => CategoryView(
                                  categoryName: _categories[index].name,
                                  categoryId: _categories[index].id,
                                )),
                          ),
                        );
                      },
                      child: HomeCategoryWidget(
                        image: "assets/images/cars.png",
                        name: _categories[index].name,
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 11.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 25.sp),
              alignment: Alignment.topRight,
              child: Text(
                "احدث الاعلانات",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: kprimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: _ads.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  Ad ad = _ads[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailsView(adID: ad.id)),
                      );
                    },
                    child: HomeVerticaleWidget(
                      rate: ad.rate,
                      catrgory: ad.subCategory.name,
                      city: ad.city.name,
                      createdAt: ad.createdAt,
                      discription: ad.title,
                      imagePath: ad.photos[0].photo,
                      isFavorite: ad.isFavorite == 'true' ? true : false,
                      username: ad.user.firstName,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
