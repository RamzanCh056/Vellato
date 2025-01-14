import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/custom_button.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String countryCode = '+1';
  String countryCodeT2 = '+1';
  String countryCodeT3 = '+1';
  int selectedValue = 0;

  final List photoDetails = [
    'Upload Company\nPhoto',
    'Upload Business\nCard Front',
    'Upload Business\nCard Back',
    'Upload Additional\nPhoto 1',
    'Upload Additional\nPhoto 2',
    'Upload Additional\nPhoto 3',
  ];

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
              'Add New Contact',
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
                'Enter the following details to add new contect',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
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
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedValue == index
                                ? AppColors.primaryColor
                                : Colors.transparent,
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
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 21,
            ),
            selectedValue == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Company Name:',
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
                        hintText: 'Enter Company Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Arabic Company Name (optional):',
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
                        hintText: 'Enter Arabic Company Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Location:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ReusableTextForm(
                              filledColor: Colors.grey.shade50,
                              hintText: 'Enter location',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              Icons.gps_fixed,
                              size: 25,
                              color: AppColors.primaryWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Main Contact Name:',
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
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Main Person Mobile:',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Other Mobile Numbers (optional):',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Photos:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        itemCount: photoDetails.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.4,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            decoration: ShapeDecoration(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.primaryColor,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  photoDetails[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.11,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 52,
                            width: MediaQuery.sizeOf(context).width * 0.33,
                            decoration: ShapeDecoration(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel',
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
                              child: CustomButton(title: 'Save', onTap: () {})),
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Main Contact Name:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: ShapeDecoration(
                          color: Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Opacity(
                              opacity: 0.50,
                              child: Text(
                                'Choose Main Contact',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    padding: EdgeInsets.zero,
                                    height: 40,
                                    onTap: () {},
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 40),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [],
                                            )),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              offset: const Offset(0, 30),
                              color: AppColors.primaryWhite,
                              surfaceTintColor: AppColors.primaryWhite,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.primaryBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Person Name:',
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
                        hintText: 'Enter Person Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Mobile Number:',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Main Person Number',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Other Mobile Numbers (optional):',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: VerticalDivider(
                                      thickness: 1,
                                      width: 1,
                                      color: Colors.black
                                          .withOpacity(0.15000000596046448),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Photos:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        itemCount: photoDetails.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.4,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            decoration: ShapeDecoration(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.primaryColor,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  photoDetails[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.11,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 52,
                            width: MediaQuery.sizeOf(context).width * 0.33,
                            decoration: ShapeDecoration(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel',
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
                              child: CustomButton(title: 'Save', onTap: () {})),
                        ],
                      ),
                    ],
                  ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
