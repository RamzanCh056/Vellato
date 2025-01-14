import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/auth_screen/sign_in_screen.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/setting_screens/change_password.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/setting_screens/edit_personal_info.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

import '../../../../widget/custom_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
     body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.20),
                    child: SvgPicture.asset(
                        fit: BoxFit.cover,
                        height: 25,
                        width: 25,
                        color: AppColors.primaryColor,
                        "assets/icons/auth_screens/man.svg"),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                     "john_123@gmail.com",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'What is your name?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 52,
                    width: MediaQuery.sizeOf(context).width*0.65,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: ShapeDecoration(
                      color: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'John Doe',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(

                        title: 'Change', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPersonalInfo()));
                    },),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.05000000074505806),
                      ),
                      borderRadius: BorderRadius.circular(110),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x07000000),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.primaryColor.withOpacity(0.20),
                        child: Icon(Icons.lock_rounded,color: AppColors.primaryColor,size: 17,),
                      ),
                      SizedBox(width: 19,),
                      Expanded(
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.699999988079071),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,color: AppColors.primaryBlack,size: 20,),


                    ],


                    )
                ),
              ),

              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                },
                child: Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.05000000074505806),
                        ),
                        borderRadius: BorderRadius.circular(110),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x07000000),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.primaryColor.withOpacity(0.20),
                          child: SvgPicture.asset(
                              color: AppColors.primaryColor,
                              "assets/icons/auth_screens/Group 1000022194.svg"),
                        ),
                        SizedBox(width: 19,),
                        Expanded(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,color: AppColors.primaryBlack,size: 20,),


                      ],


                    )
                ),
              ),
            ],
          )),
    );
  }
}

