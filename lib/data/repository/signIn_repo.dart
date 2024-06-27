import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/signIn_Model.dart';
import '../../utilities/constants.dart';
import '../api/apiClient.dart';

class SignInRepo {
  final ApiClient apiClient;

  SignInRepo({required this.apiClient});

  Future<Response> login(SignInModel signInModel) async {
    return await apiClient.postData(kPostSignInUri, signInModel.toJson());
  }

  Future saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    Box box = await Hive.openBox('myBox');
    return await box.put(kToken, token);
  }
}
