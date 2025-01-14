import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/contacts/add_contact_number.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/contacts/edit_contact.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/home_screen/register_visit.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<ContactModel> contactData = [
    ContactModel(
        name: 'Jane Cooper',
        occupation: 'UrbanMart',
        number: "+1 (800) 342-4952"),
    ContactModel(
        name: 'Robert Fox',
        occupation: 'FreshNest Foods',
        number: "+1 (800) 342-4952"),
    ContactModel(
        name: 'Devon Lane',
        occupation: 'PrimeLink Logistics',
        number: "+1 (800) 342-4952"),
    ContactModel(
        name: 'Kristin Watson',
        occupation: 'Luxura Living',
        number: "+1 (800) 342-4952"),
    ContactModel(
        name: 'Bessie Cooper',
        occupation: 'Trendify Commerce',
        number: "+1 (800) 342-4952"),
    ContactModel(
        name: 'Arlene McCoy',
        occupation: 'EcoWave Electronics',
        number: "+1 (800) 342-4952"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          focusElevation: 0,
          highlightElevation: 0,
          disabledElevation: 0,
          hoverElevation: 0,
          elevation: 0,
          onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddContact()));
          },
          child: const Icon(
            Icons.add,
            color: AppColors.primaryWhite,
          )),
      body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              const Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableTextForm(
                hintText: 'Search Contacts',
                filledColor: Colors.grey.shade50,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child:
                        SvgPicture.asset("assets/icons/auth_screens/Icon.svg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Available Contacts',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/auth_screens/Group 25.svg")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(
                  contactData.length,
                  (index) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  Colors.black.withOpacity(0.05000000074505806),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            const BoxShadow(
                              color: Color(0x07000000),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 17,
                              backgroundColor:
                                  AppColors.primaryColor.withOpacity(0.20),
                              child: SvgPicture.asset(
                                  fit: BoxFit.cover,
                                  height: 17,
                                  width: 15,
                                  color: AppColors.primaryColor,
                                  "assets/icons/auth_screens/man.svg"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          contactData[index].name,
                                          style: const TextStyle(
                                            color: Color(0xFF6B1514),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          contactData[index].occupation,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          contactData[index].number,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditContact()));
                                      },
                                      child: SvgPicture.asset(
                                          "assets/icons/auth_screens/edit.svg")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/auth_screens/delete.svg"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
            ],
          )),
    );
  }
}

class ContactModel {
  String name;
  String occupation;
  String number;

  ContactModel(
      {required this.name, required this.occupation, required this.number});
}
