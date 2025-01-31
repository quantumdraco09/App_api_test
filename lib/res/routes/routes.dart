import 'package:food_delivery/pages/home_page_from_signUp.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:food_delivery/pages/sign_up_scree.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(name: '/login_view', page: () => LoginScreen()),
      GetPage(name: '/signup_view', page: () => SignUpScreen()),
      GetPage(name: '/homeViewfromSignup', page: () => HomePageFromSignup())
    ];
  }
}
