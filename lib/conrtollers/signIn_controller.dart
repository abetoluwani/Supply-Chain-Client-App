import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/signIn_repo.dart';
import '../models/responseModel.dart';
import '../models/signIn_Model.dart';

class SignInController extends GetxController implements GetxService {
  final SignInRepo signInRepo;

  SignInController({required this.signInRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> login(SignInModel signInModel) async {
    _isLoading = true;
    Response response = await signInRepo.login(signInModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      signInRepo.saveUserToken(response.body["token"]);
      print('reponse is ${response.body["token"]}');
      responseModel = ResponseModel(
        true,
        response.body['message'],
        response.body['token'],
      );
    } else {
      responseModel = ResponseModel(
        false,
        response.body['message'],
        response.body['token'],
      );
      print(response.statusCode);
    }
    _isLoading = true;
    update();
    return responseModel;
  }
}
