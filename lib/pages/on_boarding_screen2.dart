
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/welcome_controller.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:food_delivery/utils/color.dart';
import 'package:food_delivery/widgets/container_button.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  final PageController _pageController = PageController(initialPage: 0);
  final WelcomeController controller = Get.put(WelcomeController());
  int pagemodelIndex = 0;

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Obx(
        () => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  pagemodelIndex = index;
                  controller.changePage(index);
                },
                controller: _pageController, // Use persistent controller
                children: [
                  buildPage(
                      height, width, 'assets/intro1.png', 'All your favorites',
                      'Get all your loved foods in one place, you just place the order we do the rest'),
                  buildPage(
                      height, width, 'assets/intro2.png', 'All your favorites',
                      'Get all your loved foods in one place, you just place the order we do the rest'),
                  buildPage(
                      height, width, 'assets/intro4.png', "Let's get started",
                      'Get all your loved foods in one place, you just place the order we do the rest'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                    dotsCount: 3,
                    
                    position: controller.state.index.value,
                    decorator: DotsDecorator(
                      activeColor: primaryShade,
                      size: const Size.square(9),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(height: height * .023),
                  InkWell(
                    onTap: () {
                      if (pagemodelIndex < 2) {
                        pagemodelIndex++;
                        _pageController.animateToPage(
                          pagemodelIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        controller.changePage(pagemodelIndex);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      }
                      print( "pagemodelinde $pagemodelIndex" );
                    },
                    child: Container(
                      height: width * .14,
                      width: width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryShade,
                      ),
                      child: Center(
                        child: pagemodelIndex==2 ? 
                        Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                    
                    :  Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .004),

                  
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: pagemodelIndex==2 ?  SizedBox()
                    
                    :
                     Text( 'Skip',
                      style: TextStyle(
                          color: greyColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )  
                    
                  ),
                  SizedBox(height: height * .03),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(double height, double width, String imagePath,
      String title, String description) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * .35,
            width: width * .8,
            child: Image.asset(imagePath),
          ),
          SizedBox(height: height * .05),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}










