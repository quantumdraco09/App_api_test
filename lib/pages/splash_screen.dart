

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/on_boarding_screeen.dart';
import 'package:food_delivery/pages/on_boarding_screen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  Timer(Duration(seconds: 2), 
  ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen2(),)));
  
  
  

  }





  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return  Scaffold(


        body: Container(
          height: double.infinity,
          width: double.infinity,


          child: Center(child: Image(image: AssetImage('assets/logo.png'),
            width: screenWidth * .6,
          )),
        ) ,


    );
  }
}