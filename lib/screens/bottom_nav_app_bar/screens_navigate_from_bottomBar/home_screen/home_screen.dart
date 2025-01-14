import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vellato/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<VisitorMode> visitorList = [
    VisitorMode(
        name: 'Jane Cooper',
        occupation: 'UrbanMart',
        time: 'today, Dec 28,24 - 11:00 AM'),
    VisitorMode(
        name: 'Robert Fox',
        occupation: 'FreshNest Foods',
        time: 'today, Dec 28,24 - 11:00 AM'),
    VisitorMode(
        name: 'Devon Lane',
        occupation: 'PrimeLink Logistics',
        time: 'today, Dec 28,24 - 11:00 AM'),
    VisitorMode(
        name: 'Kristin Watson',
        occupation: 'Luxura Living',
        time: 'today, Dec 28,24 - 11:00 AM'),
    VisitorMode(
        name: 'Bessie Cooper',
        occupation: 'Trendify Commerce',
        time: 'today, Dec 28,24 - 11:00 AM'),
    VisitorMode(
        name: 'Arlene McCoy',
        occupation: 'EcoWave Electronics',
        time: 'today, Dec 28,24 - 11:00 AM'),
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
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConversationScreen()));
          },
          child:

         Icon(Icons.add,color: AppColors.primaryWhite,)),
      body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Color(0xFF6C6C6C),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Today’s Visits',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: visitorList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.8,
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return _buildVisitor(
                      name: visitorList[index].name,
                      occupation: visitorList[index].occupation,
                      time: visitorList[index].time);
                },
              ),
            ],
          )),
    );
  }

  Widget _buildVisitor(
      {required String name,
      required String occupation,
      required String time}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.02),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.primaryColor.withOpacity(0.20),
                child: SvgPicture.asset(
                    fit: BoxFit.cover,
                    height: 17,
                    width: 15,
                    color: AppColors.primaryColor,
                    "assets/icons/auth_screens/man.svg"),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    occupation,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Visit time:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 7,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class VisitorMode {
  final String name;
  final String occupation;
  final String time;

  VisitorMode(
      {required this.name, required this.occupation, required this.time});
}
