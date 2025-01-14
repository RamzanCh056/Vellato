import 'package:flutter/material.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/custom_button.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class RegisterVisit extends StatefulWidget {
  const RegisterVisit({super.key});

  @override
  State<RegisterVisit> createState() => _RegisterVisitState();
}

class _RegisterVisitState extends State<RegisterVisit> {
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
                'Register Visit',
                style: TextStyle(  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 13,),
              const Opacity(
                opacity: 0.50,
                child: Text(
                  'Enter  the following details to register visit',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 14,),
              const Text(
                'Location:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),
              ReusableTextForm(
                filledColor: Colors.grey.shade50,
                hintText: 'Location',
              ),
              const SizedBox(height: 15,),
              const Text(
                'Client:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),
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
                  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Opacity(
                      opacity: 0.50,
                      child: Text(
                        'Choose Client',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            height: 40,
                            onTap: () {

                            },
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20, right: 40),
                                    child:

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),

                        ];
                      },
                      offset: const Offset(0, 30),
                      color: AppColors.primaryWhite,
                      surfaceTintColor: AppColors.primaryWhite,
                      icon:   const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryBlack,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'Visit Activities:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),

              TextFormField(
                  maxLines:6,
                  style: const TextStyle(color:AppColors.primaryBlack),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      hintText: "Describe visit activities here...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.30),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),

                      contentPadding: const EdgeInsets.all(10),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:  BorderSide(color: AppColors.borderColor.withOpacity(0.08)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:  const BorderSide(color:AppColors.primaryColor),
                      )),
               ),
              const SizedBox(height: 15,),
              const Text(
                'Time Spent:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),
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
                  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Opacity(
                      opacity: 0.50,
                      child: Text(
                        'Choose Visit Time',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            height: 40,
                            onTap: () {

                            },
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20, right: 40),
                                    child:

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),

                        ];
                      },
                      offset: const Offset(0, 30),
                      color: AppColors.primaryWhite,
                      surfaceTintColor: AppColors.primaryWhite,
                      icon:   const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryBlack,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'Upload Media:',
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
                  'You can upload up to 6 photos or videos',
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 52,
                    width: MediaQuery.sizeOf(context).width*0.33,
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
                  const SizedBox(width: 10,),
                  Expanded(child: CustomButton(title: 'Submit', onTap: (){})),

                ],
              ),
              const SizedBox(height:40,),
            ],
          ),
      ),
    );
  }
}
