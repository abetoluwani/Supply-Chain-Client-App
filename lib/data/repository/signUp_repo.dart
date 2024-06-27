import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:trademale/utilities/constants.dart';

import '../../models/signUp_Model.dart';
import '../api/apiClient.dart';

class SignUpRepo {
  final ApiClient apiClient;

  SignUpRepo({required this.apiClient});

  Future<Response> registeration(SignUpModel signUpModel) async {
    return await apiClient.postData(kPostSignUpUri, signUpModel.toJson());
  }

  Future saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    Box box = await Hive.openBox('myBox');
    return await box.put(kToken, token);
  }
}
