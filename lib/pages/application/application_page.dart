import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: buildPage(_index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.h),
                      topLeft: Radius.circular(20.h)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ]),
              child: BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/home.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/home.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/search2.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/search2.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Course",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/play-circel.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/play-circel.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Chat",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/message-circle.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/message-circle.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/parson2.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/parson2.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
