import 'package:flutter/material.dart';
import 'package:food_delivery/controller/login_controller.dart';
import 'package:get/get.dart';

class HomePageFromSignup extends StatefulWidget {
  HomePageFromSignup({super.key});

  @override
  State<HomePageFromSignup> createState() => _HomePageFromSignupState();
}

class _HomePageFromSignupState extends State<HomePageFromSignup> {
  List<String> list = ['shaban', 'shaikh'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final LoginController loginController = Get.put(LoginController());

    loginController.getApiHit();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    // Obx(() =>
    // ListView.builder(
    //     // itemCount: loginController.getUserApi.value.length,
    //     itemCount: list.length,
    //     itemBuilder: (context, index) {
    //       // String keys = loginController.getUserApi.keys.elementAt(index);
    //       // String values = loginController.getUserApi[keys];

    //       return ListTile(
    //         title: Text(list[index]),
    //         // subtitle: Text(values),
    //       );
    //     })

    return Scaffold(
      body: Center(
        child: Text('this is home page', style: TextStyle(fontSize: 25)),),
      );
    

    // );
  }
}
