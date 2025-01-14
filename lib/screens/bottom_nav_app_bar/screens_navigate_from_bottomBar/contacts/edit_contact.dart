import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/custom_button.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class EditContact extends StatefulWidget {
  const EditContact({super.key});

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {

  String countryCode = '+1';
  String countryCodeT2 = '+1';
  String countryCodeT3 = '+1';
  int selectedValue = 0;

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
              'Edit Contact',
              style: TextStyle(  color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,),
            ),
            const SizedBox(height: 13,),
            const Opacity(
              opacity: 0.50,
              child: Text(
                'Edit the following details to add new contact',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 27,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(2, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = index;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: const Color(0xFFB0B0B0),
                            width: 1,
                          ),
                        ),
                        child: Container(
                          height: 12,width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedValue == index ? AppColors.primaryColor : Colors.transparent,
                          ),
                        ),
                      ),
                      Text(
                        index == 0 ? "Company" : "Person",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 30,),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 21,),
            const Text(
              'Company Name:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              hintText: 'UrbanMart',
            ),
            const SizedBox(height: 15,),
            const Text(
              'Location:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableTextForm(
                    filledColor: Colors.grey.shade50,
                    hintText: 'UrbanMart',
                  ),
                ),
                const SizedBox(width: 10,),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor:
                  AppColors.primaryColor,
                  child: Icon(Icons.gps_fixed,size: 25,color: AppColors.primaryWhite,),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            const Text(
              'Main Contact Name:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              hintText: 'Enter Mobile Number',
            ),
            const SizedBox(height: 15,),


            const Text(
              'Main Person Mobile:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              prefixIcon: GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      setState(() {
                        countryCode = '+${country.phoneCode}';
                      });
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$countryCode  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height: 30,
                          child: VerticalDivider(thickness:1,width: 1,color: Colors.black.withOpacity(0.15000000596046448) ,))


                    ],
                  ),
                ),
              ),
              hintText: 'Enter Mobile Number',
            ),
            const SizedBox(height: 15,),

            const Text(
              'Other Mobile Numbers (optional):',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              prefixIcon: GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      setState(() {
                        countryCodeT2 = '+${country.phoneCode}';
                      });
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$countryCodeT2  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height: 30,
                          child: VerticalDivider(thickness:1,width: 1,color: Colors.black.withOpacity(0.15000000596046448) ,))


                    ],
                  ),
                ),
              ),
              hintText: 'Enter Mobile Number',
            ),
            const SizedBox(height: 10,),
            ReusableTextForm(
              filledColor: Colors.grey.shade50,
              prefixIcon: GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      setState(() {
                        countryCodeT3 = '+${country.phoneCode}';
                      });
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$countryCodeT3  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height: 30,
                          child: VerticalDivider(thickness:1,width: 1,color: Colors.black.withOpacity(0.15000000596046448) ,))


                    ],
                  ),
                ),
              ),
              hintText: 'Enter Mobile Number',
            ),
            const SizedBox(height: 15,),

            const Text(
              'Attached Individuals:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/auth_screens/man.svg"),
                const SizedBox(width: 10,),
                const Expanded(child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Brooklyn Simmons',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '(201) 555-0124',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )),
                SvgPicture.asset("assets/icons/auth_screens/delete.svg"),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/auth_screens/man.svg"),
                const SizedBox(width: 10,),
                const Expanded(child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Brooklyn Simmons',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '(201) 555-0124',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )),
                SvgPicture.asset("assets/icons/auth_screens/delete.svg"),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/auth_screens/man.svg"),
                const SizedBox(width: 10,),
                const Expanded(child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Brooklyn Simmons',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '(201) 555-0124',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )),
                SvgPicture.asset("assets/icons/auth_screens/delete.svg"),
              ],
            ),
            const SizedBox(height: 20,),

            const Text(
              'Photos:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5,),
            const Opacity(
              opacity: 0.88,
              child: Text(
                'Upload company & business card photo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10,),

            GridView.builder(
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.4,
                  crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10
              ), itemBuilder: (BuildContext context, int index) { return     Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
              decoration: ShapeDecoration(
                color: Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined,color: AppColors.primaryColor,size: 30,),
                  SizedBox(height: 10,),
                  Text(
                    'Upload photo / video',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.11,
                    ),
                  )
                ],
              ),

            ); },),
            const SizedBox(height:36,),
            CustomButton(title: 'Save Changes', onTap: (){}),
            const SizedBox(height:40,),
          ],
        ),
      ),
    );
  }
}
