


import 'package:food_delivery/data/network/network_api_service.dart';
import 'package:food_delivery/res/app_url/app_url.dart';

class LoginRepository {

final _apiService = NetworkApiService();


Future<dynamic> loginApi (var data) async {

  dynamic response = await  _apiService.postApi(data, AppUrl.loginApi);




return response;

}

Future<dynamic> registerApi (var data) async {

  dynamic response = await  _apiService.postApi(data, AppUrl.registerApi);




return response;

}

Future<dynamic> getApi (var data, String id) async {

  dynamic response = await  _apiService.getApi( data, AppUrl.getAPi(id), );

return response;

}



}