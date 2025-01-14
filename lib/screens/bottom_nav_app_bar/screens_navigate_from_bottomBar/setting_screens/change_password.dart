import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/custom_button.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

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
              'Change Password',
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
              height: 15,
            ),

            const Text(
              'Current Password:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              hintText: 'Enter Current Password',
            ),
            const SizedBox(
              height: 15,
            ),

            const Text(
              'New Password:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              hintText: 'New Password',
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Confirm Password:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              hintText: 'Confirm New Password',
            ),
            const SizedBox(
              height: 152,
            ),
            CustomButton(title: "Save Changes", onTap:(){})

          ],
        ),
      ),
    );
  }
}
