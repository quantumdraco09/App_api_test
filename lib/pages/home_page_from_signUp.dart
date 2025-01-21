import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/login_controller.dart';
import 'package:food_delivery/models/get_user/get_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageFromSignup extends StatefulWidget {
  HomePageFromSignup({super.key});

  @override
  State<HomePageFromSignup> createState() => _HomePageFromSignupState();
}

class _HomePageFromSignupState extends State<HomePageFromSignup> {
  final LoginController homePageController = Get.put(LoginController());
  GetUserModel? existingUser;

  existingUserGet() async {
    print('from existing userfunction');
    existingUser = await homePageController.getUser();

    print('existing user value is the $existingUser');
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    existingUserGet();
    print('from init state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: existingUserGet(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error is ${snapshot.error}'),
                );
              } else {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        existingUser!.id.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        existingUser!.username.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        existingUser!.email.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        existingUser!.mobile.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        existingUser!.role.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                );
              }
            })
        //         Center(
        //   child: Text('data'),
        // )
        );
  }
}
