import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/home/user_model.dart';
import 'package:food_delivery/data/network/base_api_services.dart';
import 'package:food_delivery/models/get_user/get_user_model.dart';
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

  RxMap getUserApi = <String, dynamic>{}.obs;

  final emailContoller = TextEditingController().obs;

  final passwordController = TextEditingController().obs;

  final mobileController = TextEditingController().obs;
  final usrenameControler = TextEditingController().obs;

  final roleController = TextEditingController().obs;

  RxList<String> roles = ['USER', 'ADMIN'].obs;

  RxString selectedItem = 'USER'.obs;

  String userId = '';
  String accessToken = '';

  RxBool loginOrRegister = false.obs;

  Map<String, dynamic> userMap = Map<String, dynamic>();

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

  // Save user data to Local storage =====================================------------------------------------------------

  Future<void> saveUserToLocalStorage(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('access_token', loginModel.accessToken!);
    await prefs.setString('refresh_token', loginModel.refreshToken!);
    // await prefs.setString('user_id', loginModel.user!.id.toString());

    print('User data saved to local storage');

    String loginModelJson = jsonEncode(loginModel.toJson());

    await prefs.setString('loginModel', loginModelJson);
  }

  // Save user data to Local storage from sign up button =====================================------------------------------------------------

  Future<void> saveUserToLocalStorageRegister(
      RegistrationModel registerModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('access_token', registerModel.accessToken!);
    await prefs.setString('refresh_token', registerModel.refreshToken!);

    print('User data saved to local storage from the sign up api hit');

    String registerModelJson = jsonEncode(registerModel.toJson());

    await prefs.setString('registerModelJson', registerModelJson);
  }

  // save user data to local storage getting from getapi response -----------------------------=========================

  Future<void> saveUserGetApiData(GetUserModel getApiModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String getApiModelJson = jsonEncode(getApiModel.toJson());

    print(
        'from saveusergetapidata the value of the getapimodel json is the $getApiModelJson');

    await prefs.setString('getApiModelJson', getApiModelJson);
  }

//  login api hit =================================--------------------------------------------

  Future<GetUserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('from the getuser function');
    String? userJson = prefs.getString('getApiModelJson');

    print(
        'userjson is actually storing in the userjson which means we can get user $userJson');

    userMap = jsonDecode(userJson!);

    print('usermap from the getuser is the $userMap');

    return GetUserModel.fromJson(userMap);
  }

//  login api hit =================================--------------------------------------------

  void loginApi() {
    loginOrRegister.value = true;
    print('loginorregister value is $loginOrRegister');

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

// saving user to local storage
        await saveUserToLocalStorage(loginModel);

// get api hit immediately
        getApiHit();
        Get.toNamed(RoutesName.homeViewfromSignUp);
      } else {
        Get.snackbar('Error', 'Invalid credentials',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10));
      }
    }).catchError((error) {
      print('Erro during login $error');

      Get.snackbar('Error', 'Something went wrong.Please try again');
    });
  }

//   check betwenn loginmodel and registermodel -----------------------------------------------------------------------------------------------

  Future<Map<String, String>> loginModelOrRegisterModel() async {
    if (loginOrRegister.value) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? accessToken = prefs.getString('access_token');

      String? loginModelJson = prefs.getString('loginModel');

      print('login model from get api is $loginModelJson');

      Map<String, dynamic> jsonMap = json.decode(loginModelJson!);

      print('jsonmap is the $jsonMap');

      userId = jsonMap['user']['id'].toString();

      print('id value is the $userId');
      return {'accessToken': accessToken!, 'userId': userId};
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? accessToken = prefs.getString('access_token');

      String? registerModelJson = prefs.getString('registerModel');

      print('login model from get api is $registerModelJson');

      Map<String, dynamic> jsonMap = json.decode(registerModelJson!);

      print('jsonmap is the $jsonMap');

      userId = jsonMap['user']['id'].toString();

      print('id value is the $userId');

      return {'accessToken': accessToken!, 'userId': userId};
    }
  }

// signup api hit -----------------------------------------------------------------------------------------------

  void signupApi() {
    loginOrRegister.value = false;
    print('loginorregister value is $loginOrRegister');

    Map data = {
      "username": usrenameControler.value.text,
      "password": passwordController.value.text,
      "email": emailContoller.value.text,
      "mobile": mobileController.value.text,
      "role": selectedItem.value
    };

    _apiServices.registerApi(data).then((value) {
      print('value is the $value');

      if (value == null &&
          value['access_token'] == null &&
          value['message'] == 'User already exist') {
        print("Error user alredady exists");
        Get.snackbar('Error', 'User already exist',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10));
      } else if (value != null && value['access_token'] != null) {
        RegistrationModel registerModel = RegistrationModel(
            accessToken: value['access_token'],
            refreshToken: value['refresh_token'],
            message: value['message']);
        print('Successfully stored user in register  model');

        print(
            'Access token from register modle is  ${registerModel.accessToken}');

        saveUserToLocalStorageRegister(registerModel);

        print('registerModel stored in local storage ');

        // get api hit
        getApiHit();
        Get.toNamed(RoutesName.homeViewfromSignUp);

        
      } else {
        Get.snackbar('Error', 'Invalid credentials',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10));
      }
    }).catchError((error) {
      print('Erro during login $error');

      Get.snackbar('Error', 'Something went wrong.Please try again');
    });
  }

  // get api hit ==================-------------------------==================

  void getApiHit() async {
    print('from getApiHit');

    Map<String, String> tokenAndId = await loginModelOrRegisterModel();

    userId = tokenAndId['userId']!;
    accessToken = tokenAndId['accessToken']!;

    print('accesstoken from get api hit is $accessToken');

    print('userid from the get api hit is the $userId');

    _apiServices.getApi(accessToken, userId).then((value) {
      print(
          'value i am getting from the apiservices getapi function is the $value');

      Map<String, dynamic> getData = value;

      GetUserModel getApiModel = GetUserModel.fromJson(getData);

      print('getapi model from getapi hit is the $getApiModel');

      saveUserGetApiData(getApiModel);
    }).catchError((error) {
      print('Erro during login $error');

      Get.snackbar('Error', 'Something went wrong.Please try again');
    });
  }
}
