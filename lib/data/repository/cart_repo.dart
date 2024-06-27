import 'package:get/get_connect/http/src/response/response.dart';
import 'package:trademale/utilities/constants.dart';

import '../../models/order_Model.dart';
import '../api/apiClient.dart';

class CartRepo {
  final ApiClient apiClient;

  CartRepo({required this.apiClient});

  Future<Response> checkOut(OrderModel orderModel) async {
    return await apiClient.postData(kPostOrderUri, orderModel.toJson());
  }
}
