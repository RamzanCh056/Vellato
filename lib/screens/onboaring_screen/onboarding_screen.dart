import 'package:flutter/material.dart';
import 'package:vellato/screens/auth_screen/sign_in_screen.dart';

import '../../themes/app_colors.dart';
import '../../widget/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'imagePath': 'assets/images/onboarding/Onbaording 5.png',
      'title': 'Get Started with\nVellato',
      'subTitle':
      'Easily track your daily sales visits and stay organized. Quickly log your client interactions with just a few taps.',
    },
    {
      'imagePath': 'assets/images/onboarding/Onbaording 6.png',
      'title': 'Powerful Features at\nYour Fingertips',
      'subTitle':
      'Manage your client list, view reports, and capture photos or videos of your visits — all within one app.',
    },
  ];

  void _goToNextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page — navigate to SignUpScreen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen() ));
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea if you want to avoid the notch or dynamic island overlap
      body: Stack(
        children: [
          // Main PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final item = _pages[index];
              return _buildPage(
                imagePath: item['imagePath'] ?? '',
              );
            },
          ),

          // The bottom "rounded" container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomContainer(context),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryWhite,
    );
  }

  Widget _buildPage({required String imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Top image area
        Expanded(
          child: Image.asset(
            imagePath,
            width: double.infinity,
            fit: BoxFit.cover, // fills width, may crop top/bottom a bit
          ),
        ),
        // The rest (title, subtitle, button, dots) is in the bottom container
      ],
    );
  }

  Widget _buildBottomContainer(BuildContext context) {
    final pageData = _pages[_currentPage];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Dots Indicator
          _buildPageIndicator(),
          const SizedBox(height: 10,),
          // Title
          Text(
            pageData['title']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),

          // Subtitle
          Text(
            pageData['subTitle']!,
            style:TextStyle(
              color: Colors.white.withOpacity(0.93),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),

          // Continue Button
          CustomButton(
            title: _currentPage==0?'Next':'Get Started',
            onTap: _goToNextPage,
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen() ));
            },
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.90),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(_pages.length, (index) {
        final isActive = _currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive?20:8,
          decoration: BoxDecoration(
        color: isActive?AppColors.primaryColor:Colors.transparent,
            border: Border.all(color: isActive?Colors.transparent:AppColors.primaryWhite),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

