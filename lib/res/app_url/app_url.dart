import 'package:food_delivery/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUrl extends GetxController {
  static const String baseUrl = 'http://192.168.1.30:8080';

  static const String loginApi = '$baseUrl/login';

  static const String registerApi = '$baseUrl/register';

//  static  String getAPi = '$baseUrl/user/1';

 

  static String getAPi(String id) {

    String getApi = '$baseUrl/user/$id';

    return getApi;
  }
}


// http://192.168.1.30:8080/login

