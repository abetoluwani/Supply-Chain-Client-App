import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  String?
      token; //because when you need to talk to the server u should send token
  late String appBaseUrl; //server url
  late Map<String, String> mainHeaders; //to store the data

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl; //Getx should know the baseUrl you want to reach
    timeout = Duration(seconds: 30); //and the time of trying connect to server

    mainHeaders = {
      'Content_type': 'application/json ; charset=UTF-8',
      'Authorization': 'Bearer $token', //Bearer is type of our token
    };
  }

  void updateHeader(String token) {
    mainHeaders = {
      'Content_type': 'application/json ; charset=UTF-8',
      'Authorization': 'Bearer $token', //Bearer is type of our token
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: mainHeaders);
      return response;
    } catch (e) {
      return (Response(
        statusCode: 1,
        statusText: e.toString(),
      ));
    }
  }

  Future<Response> postData(String uri, dynamic data) async {
    try {
      Response response = await post(uri, data, headers: mainHeaders);
      //print("main headers is :${mainHeaders}");
      // print("data to be post is ${data}");
      // print("uri to be post from :${uri}");
      return response;
    } catch (e) {
      return (Response(
        statusCode: 1,
        statusText: e.toString(),
      ));
    }
  }
}
