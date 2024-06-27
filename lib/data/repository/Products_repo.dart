// api for home page , (list of random products)
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:trademale/utilities/constants.dart';

import '../api/apiClient.dart';

class ProductsRepo extends GetxService {
  final ApiClient apiClient;

  ProductsRepo({required this.apiClient});

  // Future<Response> getProductsList() async {
  //   return await apiClient.getData(kGetProductsUri);
  // }

  Future<Response> getProductsListByPage(int currentPage) async {
    return await apiClient.getData('$kGetProductsUri?page=$currentPage');
  }

  Future<Response> getProductDetails(String productId) async {
    return await apiClient.getData(kGetProductIdUri + productId);
  }
}
