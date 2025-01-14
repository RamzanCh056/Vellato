import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/auth_screen/forgot_password.dart';
import 'package:vellato/screens/bottom_nav_app_bar/bottom_nav_app_bar.dart';

import '../../themes/app_colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/reusable_textfiled.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Log in to your account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextForm(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset("assets/icons/auth_screens/man.svg"),
                    ),
                    hintText: 'Enter your username',
                    filledColor:  Colors.grey.shade50,),
                  const SizedBox(height: 20,),
                  ReusableTextForm(
                    obscureText: isPassword,
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isPassword=!isPassword;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: isPassword==false?SvgPicture.asset("assets/icons/auth_screens/Eye.svg"):const Icon(
                          size: 20,
                          Icons.remove_red_eye_outlined,color: Color(0xff9F9F9F),),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset("assets/icons/auth_screens/Lock.svg"),
                    ),
                    hintText: 'Enter your password',
                    filledColor: Colors.grey.shade50,),
                  const SizedBox(height: 11,),
              Row(
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword(),));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50,),
                  CustomButton(title: 'Log In', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavAppBar()));

                  })

                ],
              ),
            ),
            GestureDetector(
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));

              },
              child:

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'For new accounts, Kindly ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: 'Contact Your Management',
                      style: TextStyle(
                        color:AppColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
