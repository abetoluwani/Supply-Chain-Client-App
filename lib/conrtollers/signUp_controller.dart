import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/signUp_repo.dart';
import '../models/responseModel.dart';
import '../models/signUp_Model.dart';

class SignUpController extends GetxController implements GetxService {
  final SignUpRepo signUpRepo;

  SignUpController({required this.signUpRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> registeration(SignUpModel signUpModel) async {
    _isLoading = true;
    Response response = await signUpRepo.registeration(signUpModel);
    print(signUpModel);
    print("respoonse status is${response.statusCode}");
    print("response is${response.body}");
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      signUpRepo.saveUserToken(response.body["token"]);
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
