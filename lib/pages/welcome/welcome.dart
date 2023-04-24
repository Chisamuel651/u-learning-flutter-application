import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/welcome/block/welcome_bloc.dart';
import 'package:ulearning/pages/welcome/block/welcome_event.dart';
import 'package:ulearning/pages/welcome/block/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 35.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  // print("index value is ${index}");
                },
                children: [
                  _page(
                      1,
                      context,
                      "next",
                      "N-tec e-learning",
                      "Our Team creates design for mobile apps for IOS and Android platforms",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "let's go",
                      "View Our Courses",
                      "We Install Internet in Hotels, Schools, Hospital etc",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "get started",
                      "Be Well trained",
                      "Our team develops high-level web applications in Cameroon",
                      "assets/images/man.png"),
                ],
              ),
              Positioned(
                bottom: 90.h,
                child: DotsIndicator(
                  position: state.page.toDouble(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: AppColors.primaryFourElementText,
                      activeColor: AppColors.orangeColor,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              )
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
          title,
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        )),
        Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            )),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              // animation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              // takes to new page
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: const[
                  BoxShadow(
                      color: AppColors.primaryFourElementText,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            )),
          ),
        )
      ],
    );
  }
}
