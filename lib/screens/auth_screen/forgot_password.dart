import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/auth_screen/verification_code_screen.dart';

import '../../themes/app_colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/reusable_textfiled.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    'Forgot Password',
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
                      'Enter the email address to get verification code reset password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 89,
                  ),
                  ReusableTextForm(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset("assets/icons/auth_screens/mail.svg"),
                    ),
                    hintText: 'Email address',
                    filledColor: Colors.grey.shade50,),
                  const SizedBox(height: 178,),
                  CustomButton(title: 'Send Code', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationCodeScreen()));

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
