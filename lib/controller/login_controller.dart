import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/home/user_model.dart';
import 'package:food_delivery/data/network/base_api_services.dart';
import 'package:food_delivery/models/login/login_model.dart';
import 'package:food_delivery/models/registration/registration_model.dart';
import 'package:food_delivery/pages/home_page_from_signUp.dart';
import 'package:food_delivery/repository/home_repository/login_repository.dart';
import 'package:food_delivery/res/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final _apiServices = LoginRepository();

  RxBool remember = false.obs;
  RxBool obscuretextPassword = true.obs;

  RxList<String> items = ['USER', 'ADMIN'].obs;

  var getUserApi = <String, dynamic>{}.obs;

  final emailContoller = TextEditingController().obs;

  final passwordController = TextEditingController().obs;

  final mobileController = TextEditingController().obs;
  final usrenameControler = TextEditingController().obs;

  final roleController = TextEditingController().obs;

  RxBool loading = false.obs;

  RxList<String> roles = ['USER', 'ADMIN'].obs;

  RxString selectedItem = 'USER'.obs;

  RxString userId = ''.obs;

  RxString id = ''.obs;
  // screens functionality ========================-------------------------------------------------

  void changeCheckbox(bool value) {
    print(value);
    remember.value = value;
    print('remember value ${remember.value}');
  }
  // ======================================================-------------------------------

  void changePasswordVisiblity() {
    obscuretextPassword.value = !obscuretextPassword.value;
  }

  void changeDropDownValue(String? value) {
    selectedItem.value = value!;
  }

// Save user in the Login Model   -----------------------------------------------------------------------------------------------

  Future<void> saveUserModel(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

// convert the usermodol to json string

    String loginModelJson = jsonEncode(loginModel.toJson());

    print('userMOdel jsonencode is this $loginModelJson');

// save the shared preferences

    await prefs.setString('loginModel', loginModelJson);

    print('saved login model to the LoginModel');
  }

  // Save user data to Local storage =====================================------------------------------------------------

  Future<void> saveUserToLocalStorage(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('access_token', loginModel.accessToken!);
    await prefs.setString('refresh_token', loginModel.refreshToken!);
    await prefs.setString('user_id', loginModel.user!.id.toString());

    print('User data saved to local storage');

    String loginModelJson = jsonEncode(loginModel.toJson());

    await prefs.setString('loginModel', loginModelJson);
  }

  // Retrieve user data from local storage ============================-------------------------------------------------

  Future<LoginModel?> getUserFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? accessToken = prefs.getString('access_token');
    String? refreshToken = prefs.getString('refresh_token');
    // String? userId = prefs.getString('loginModel.user')

    if (accessToken != null && refreshToken != null) {
      return LoginModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    return null;
  }

//  login api hit =================================--------------------------------------------

  void loginApi() {
    Map data = {
      'username': emailContoller.value.text,
      'password': passwordController.value.text
    };

    print(data);

    _apiServices.loginApi(data).then((value) async {
      print('value is the $value');

      if (value != null &&
          value['access_token'] != null &&
          value['user'] != null) {
        LoginModel loginModel = LoginModel.fromJson(value);

//    saving user to login model
        await saveUserModel(loginModel);

// saving user to local storage
        await saveUserToLocalStorage(loginModel);

// get api hit immediately
        getApiHit();

        Get.toNamed(RoutesName.homeView);
      } else {
        Get.snackbar('Error', 'Invalid credentials',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10));
      }
    }).catchError((error) {
      loading.value = false;

      print('Erro during login $error');

      Get.snackbar('Error', 'Something went wrong.Please try again');
    });
  }

// signup api hit -----------------------------------------------------------------------------------------------

//   void signupApi() {
//     loading.value = true;

//     Map data = {
//       "username": usrenameControler.value.text,
//       "password": passwordController.value.text,
//       "email": emailContoller.value.text,
//       "mobile": mobileController.value.text,
//       "role": selectedItem.value
//     };

//     print('Register data iisisiis $data');

//     _apiServices.registerApi(data).then((value) {
//       loading.value = false;

//       print('value is the $value');

// // "message": "User already exist"
//       if (value == null &&
//           value['access_token'] == null &&
//           value['message'] == 'User already exist') {
//         print("Error user alredady exists");
//         Get.snackbar('Error', 'User already exist',
//             snackPosition: SnackPosition.TOP,
//             backgroundColor: Colors.white,
//             colorText: Colors.black,
//             margin: EdgeInsets.only(top: 20, left: 10, right: 10));
//       } else if (value != null && value['access_token'] != null) {
//         UserModel registerModel = UserModel(
//             accessToken: value['access_token'],
//             refreshToken: value['refresh_token'],
//             message: value['message']);
//         print('Successfully stored user in usrregister model');

//         print(
//             'Access token from register modle is  ${registerModel.accessToken}');

//         saveUserToLocalStorage(registerModel);

//         print('access token stored in local storage ');

//         Get.toNamed(RoutesName.homeViewfromSignUp);
//       } else {
//         Get.snackbar('Error', 'Invalid credentials',
//             snackPosition: SnackPosition.TOP,
//             backgroundColor: Colors.white,
//             colorText: Colors.black,
//             margin: EdgeInsets.only(top: 20, left: 10, right: 10));
//       }
//     }).catchError((error) {
//       loading.value = false;

//       print('Erro during login $error');

//       Get.snackbar('Error', 'Something went wrong.Please try again');
//     });
//   }

  // get api hit ==================-------------------------==================

  void getApiHit() async {
    print('from getApiHit');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? accessToken = prefs.getString('access_token');

    String? loginModelJson = prefs.getString('loginModel');

    print('login model from get api is $loginModelJson');

    Map<String, dynamic> jsonMap = json.decode(loginModelJson!);

    print('jsonmap is the $jsonMap');

    id.value = jsonMap['user']['id'];

    print('id value is the $id');

    _apiServices.getApi(accessToken, id as String).then((value) {
      getUserApi = jsonDecode(value);

      print('getuserapi is the $getUserApi');

      loading.value = false;
    }).catchError((error) {
      print('Erro during login $error');

      Get.snackbar('Error', 'Something went wrong.Please try again');
    });
  }
}
