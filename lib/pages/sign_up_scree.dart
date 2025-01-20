import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/login_controller.dart';
import 'package:food_delivery/utils/color.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginController signupController = Get.put(LoginController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: secondaryShade),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up ',
                          style: TextStyle(
                            fontSize: 25,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'create an account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30, // Adjust top position for form
                    child: Container(
                      width: width * 1,
                      height: height * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Email field
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'username',
                                ),
                              ),

                              TextFormField(
                                controller:
                                    signupController.usrenameControler.value,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(255, 233, 233, 233)
                                          .withOpacity(.7),
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 10.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              // Password field
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'PASSWORD',
                                ),
                              ),

                              TextFormField(
                                controller:
                                    signupController.passwordController.value,
                                decoration: InputDecoration(
                                    fillColor:
                                        const Color.fromARGB(255, 233, 233, 233)
                                            .withOpacity(.7),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          signupController
                                              .changePasswordVisiblity();
                                        },
                                        icon: Icon(signupController
                                                .obscuretextPassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                              ),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'email',
                                ),
                              ),

                              TextFormField(
                                controller:
                                    signupController.emailContoller.value,
                                decoration: InputDecoration(
                                    fillColor:
                                        const Color.fromARGB(255, 233, 233, 233)
                                            .withOpacity(.7),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          signupController
                                              .changePasswordVisiblity();
                                        },
                                        icon: Icon(signupController
                                                .obscuretextPassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                              ),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'mobile',
                                ),
                              ),

                              TextFormField(
                                  controller:
                                      signupController.mobileController.value,
                                  decoration: InputDecoration(
                                    fillColor:
                                        const Color.fromARGB(255, 233, 233, 233)
                                            .withOpacity(.7),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      borderSide: BorderSide.none,
                                    ),
                                  )),

                              DropdownButton<String>(
                                value: signupController.selectedItem.value,
                                onChanged: (String? newValue) {
                                  signupController
                                      .changeDropDownValue(newValue);
                                },
                                items: signupController.roles
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              SizedBox(height: 20),
                              // Remember me and forgot password

                              SizedBox(height: 20),
                              // Log In button
                              InkWell(
                                onTap: () {
                                  // signupController.signupApi();
                                  print('sign up api hit');
                                },
                                child: Container(
                                  height: width * 0.14,
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryShade,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sign up ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: height * .033),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          fontSize: 16, color: primaryShade),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
