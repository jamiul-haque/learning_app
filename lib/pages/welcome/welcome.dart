import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                      1,
                      context,
                      "First See Learning",
                      "Forget about a for of pager all knowledge in one lerning",
                      "Next",
                      "image one"),
                  _page(
                      2,
                      context,
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friends. let's get connected!",
                      "Next",
                      "image two"),
                  _page(
                      3,
                      context,
                      "Always Fascinated Learning",
                      "Anywhere, anytime, The time is at your discretion so study whenever you want.",
                      "get started",
                      "image three"),
                ],
              ),
              Positioned(
                bottom: 80.h,
                child: DotsIndicator(
                  position: state.page,
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String title, String subTitle,
      String buttonName, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 25.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.h, right: 25.h),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }
}
