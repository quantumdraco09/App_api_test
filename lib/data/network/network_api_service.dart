import 'dart:convert';

import 'package:food_delivery/data/network/base_api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future postApi(data, String url) async {
    dynamic responseJson;

    try {
      // Map test = {"username": "johndoe", "password": "password123"};

      final response = await http
          .post(
            Uri.parse(url),
           
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      print('url is $url');
      print(data);
      print('try block successfull');

      responseJson = returnResponse(response);

      print(responseJson);
    } catch (e) {
      print('inside catch block happened this : $e');
    }

    return responseJson;
  }


   @override
  Future getApi( token,String url) async {
    dynamic responseJson;

    try {
     

      final response = await http
          .get(
            // Uri.parse(url),
            Uri.parse('https://mocki.io/v1/2a6abd32-cb20-4662-9c0b-f4a832437b56'),
            headers: {
          'Authorization': 'Bearer $token', 
          'Content-Type': 'application/json',  
        },
          )
          .timeout(const Duration(seconds: 10));
      print('url is $url');
      // print(data);
      print('try block successfull');

      responseJson = returnResponse(response);

      print('response json fron network api service is $responseJson');
    } catch (e) {
      print('inside catch block happened this : $e');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print('200 status code');
        return responseJson;

      case 400:
        print('status code is 400');

      case 401:
        print('status code is 401');

      case 400:
        print('status code is 400');

      case 403:
        print('status code is 403');

      case 404:
        print('status code is 404');

      default:
        print('error happened while fetching data');
    }
  }
}
