import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    _buildPageModel(
      title: 'Qaribu',
      imagePath: 'assets/images/onboarding1.png',
      description: '''
Let's kickstart your journey. 
Our seamless onboarding process will introduce you to our culture, policies, and team.''',
    ),
    _buildPageModel(
      title: 'Get set to explore',
      imagePath: 'assets/images/onboarding2.png',
      description: '''
Access training materials and resources. 
We're here to help you integrate smoothly into your new role.''',
    ),
    _buildPageModel(
      title: 'Join the Conversation!',
      imagePath: 'assets/images/onboarding3.png',
      description: '''
Your success matters. 
Ask questions, engage with us, and let's achieve great things together!''',
    ),
  ];

  static PageModel _buildPageModel({
    required String title,
    required String imagePath,
    required String description,
  }) {
    return PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 90,
                      horizontal: 45,
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(description),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton() {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: Colors.orange,
      child: InkWell(
        onTap: () {
          setState(() {
            index = onboardingPagesList.length - 1;
          });
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Material get _getStarted {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: Colors.orange,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          SharedPreferences.getInstance().then((prefs) {
            prefs.setBool('isFirstTime', false);
          });
          Navigator.pushReplacementNamed(context, '/signin');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        startPageIndex: index,
        pages: onboardingPagesList,
        onPageChange: (int screenIndex) {
          setState(() {
            index = screenIndex;
          });
        },
        footerBuilder: (context, netDragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      shouldPaint: false,
                      netDragPercent: netDragDistance,
                      indicator: Indicator(
                        closedIndicator:
                            const ClosedIndicator(color: Colors.orange),
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_uniform,
                          ),
                        ),
                      ),
                      pagesLength: pagesLength,
                    ),
                    if (index != pagesLength - 1)
                      materialButton
                    else
                      _getStarted,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
