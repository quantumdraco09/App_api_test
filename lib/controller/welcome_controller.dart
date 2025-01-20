import 'package:food_delivery/controller/welcome_state.dart';
import 'package:get/get.dart';



class WelcomeController extends GetxController {

final state = WelcomeState();


WelcomeController();

changePage (int index) async {
  print(index);

  state.index.value = index;
  print(state.index.value);

}





}