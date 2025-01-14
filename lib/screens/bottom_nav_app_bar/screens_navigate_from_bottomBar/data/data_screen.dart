import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/screens/bottom_nav_app_bar/screens_navigate_from_bottomBar/home_screen/register_visit.dart';
import 'package:vellato/themes/app_colors.dart';
import 'package:vellato/widget/reusable_textfiled.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int _currentIndex = 0;
  final List<ProductModel> productData = [
    ProductModel(title: "EcoSmart Wireless Earbuds", code: "RSLG-3005", priceStack: "\$89.99"),
    ProductModel(title: "RecycLED Solar Garden Lights (Set of 6)", code: "RSLG-3005", priceStack: "\$89.99"),
    ProductModel(title: "GreenLeaf Organic Shampoo", code: "RSLG-3005", priceStack: "\$89.99"),
    ProductModel(title: "SmartHome LED Bulb Pack (4pcs)", code: "RSLG-3005", priceStack: "\$89.99"),
    ProductModel(title: "SolarCharge Portable Power Bank", code: "RSLG-3005", priceStack: "\$89.99"),
    ProductModel(title: "EcoFit Yoga Mat", code: "RSLG-3005", priceStack: "\$89.99"),
  ];
  final List<ProductModel> stockData = [
    ProductModel(title: "EcoSmart Wireless Earbuds", code: "RSLG-3005", priceStack: "215 units"),
    ProductModel(title: "RecycLED Solar Garden Lights (Set of 6)", code: "RSLG-3005", priceStack: "815 units"),
    ProductModel(title: "GreenLeaf Organic Shampoo", code: "RSLG-3005", priceStack: "70 units"),
    ProductModel(title: "SmartHome LED Bulb Pack (4pcs)", code: "RSLG-3005", priceStack: "35 units"),
    ProductModel(title: "SolarCharge Portable Power Bank", code: "RSLG-3005", priceStack: "15 units"),
    ProductModel(title: "EcoFit Yoga Mat", code: "RSLG-3005", priceStack: "45 units"),

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
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterVisit()));
          },
          child: const Icon(
            Icons.file_download_outlined,
            color: AppColors.primaryWhite,
          )),
      body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              const Text(
                'Data',
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
                hintText: 'Search product by name / code...',
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
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: ShapeDecoration(
                          color: _currentIndex == 0
                              ? AppColors.primaryColor
                              : Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Price List',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _currentIndex == 0
                                  ? Colors.white
                                  : const Color(0xf40000000),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: ShapeDecoration(
                          color: _currentIndex == 1
                              ? AppColors.primaryColor
                              : Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Stock Level',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _currentIndex == 1
                                  ? Colors.white
                                  : const Color(0xf40000000),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: _currentIndex == 0
                    ? List.generate(
                        productData.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.05000000074505806),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    productData[index].title,
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Code: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        productData[index].code,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Price: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                     productData[index].priceStack,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                )
                    : List.generate(
                        stockData.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.05000000074505806),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                  stockData[index].title,
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Code: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        stockData[index].code,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Price: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        stockData[index].priceStack,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
              )
            ],
          )),
    );
  }
}

class ProductModel {
  final String title;
  final String code;
  final String priceStack;

  ProductModel(
      {required this.title, required this.code, required this.priceStack});
}
