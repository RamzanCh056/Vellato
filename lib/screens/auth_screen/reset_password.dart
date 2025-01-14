import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/auth_screen/sign_in_screen.dart';

import '../../themes/app_colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/reusable_textfiled.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPassword = false;
  bool isPasswordOne = false;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Reset Password',
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
                      'Create new password for your account',
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
                    obscureText: isPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: isPassword == false
                            ? SvgPicture.asset(
                                "assets/icons/auth_screens/Eye.svg")
                            : const Icon(
                                size: 20,
                                Icons.remove_red_eye_outlined,
                                color: Color(0xff9F9F9F),
                              ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset(
                          "assets/icons/auth_screens/Lock.svg"),
                    ),
                    hintText: 'New Password',
                    filledColor: Colors.grey.shade50,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Password must be 8 characters long',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.04),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextForm(
                    obscureText: isPasswordOne,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordOne = !isPasswordOne;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: isPasswordOne == false
                            ? SvgPicture.asset(
                                "assets/icons/auth_screens/Eye.svg")
                            : const Icon(
                                size: 20,
                                Icons.remove_red_eye_outlined,
                                color: Color(0xff9F9F9F),
                              ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset(
                          "assets/icons/auth_screens/Lock.svg"),
                    ),
                    hintText: 'Confirm Password',
                    filledColor: Colors.grey.shade50,
                  ),
                  const SizedBox(
                    height: 169,
                  ),
                  CustomButton(
                      title: 'Send Code',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
