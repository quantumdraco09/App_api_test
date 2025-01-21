import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home_page_from_signUp.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    checkUserAndNavigate();
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

Future<void> checkUserAndNavigate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isUserLogedIn = false;

  isUserLogedIn = prefs.containsKey('loginModel');

  if (!isUserLogedIn) {
    isUserLogedIn = prefs.containsKey('registereModel');
  }

  if (isUserLogedIn) {
    Get.offAll(HomePageFromSignup());
  } else {
    Get.offAll(LoginScreen());
  }
}
