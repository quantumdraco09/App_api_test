import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:food_delivery/pages/sign_up_scree.dart';
import 'package:food_delivery/res/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home: SignUpScreen(),

      getPages: AppRoutes.appRoutes(),

    );
  }
}
