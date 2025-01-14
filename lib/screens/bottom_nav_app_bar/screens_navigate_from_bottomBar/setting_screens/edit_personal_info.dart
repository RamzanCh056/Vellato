import 'package:flutter/material.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/custom_button.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {

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
              'Edit Personal Info',
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
                'Update your name',
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
              'Current Name:',
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
              hintText: 'Enter Current Name:',
            ),
            const SizedBox(
              height: 15,
            ),

            const Text(
              'New Name:',
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
              hintText: 'Enter Your New Name:',
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
