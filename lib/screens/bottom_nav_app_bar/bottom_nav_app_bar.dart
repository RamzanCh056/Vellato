import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/contacts/contact_screen.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/data/data_screen.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/home_screen/home_screen.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/setting_screens/setting_screen.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class BottomNavAppBar extends StatefulWidget {
  const BottomNavAppBar({super.key});

  @override
  State<BottomNavAppBar> createState() => _BottomNavAppBarState();
}

class _BottomNavAppBarState extends State<BottomNavAppBar> {
  final List<Widget> _bottomNavItem = [
   HomeScreen(),
   DataScreen(),
    ContactScreen(),
    SettingScreen(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: _bottomNavItem[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        color:const Color(0xffFFFFFF),
        padding: EdgeInsets.zero,
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical:5),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomTab(
                onTap: () {
                  onTabTapped(0);
                },
                activeColor: _currentIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.disableColor,
                title: "Dashboard",
                icon: _currentIndex==0?SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/dashboard_enable.svg"):SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/dashboard_dis.svg"),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(1);
                },
                activeColor: _currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.disableColor,
                title: "Data",
                icon: _currentIndex==1?SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/data_enable.svg"):SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/data_dis.svg"),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(2);
                },
                activeColor: _currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.disableColor,
                title: "Contacts",
                icon: _currentIndex==2?SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/contact_enable.svg"):SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/contact_dis.svg"),
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(3);
                },
                activeColor: _currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.disableColor,
                title: "Settings",
                icon: _currentIndex==3?SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/set_en.svg"):SvgPicture.asset(
                    height: 24,width: 24,
                    fit: BoxFit.cover,
                    "assets/icons/bottom_bar/setting_dis.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  final String title;
  final Color activeColor;
  final Widget icon;
  final VoidCallback onTap;

  const BottomTab({
    super.key,
    required this.title,
    required this.activeColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          icon,
          const SizedBox(
            height: 5,
          ),
          Text(
              title,
              style:AppTextStyles.montserrat.copyWith( color: activeColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,)
          )
        ],
      ),
    );
  }
}