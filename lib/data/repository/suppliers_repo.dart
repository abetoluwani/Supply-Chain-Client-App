import 'package:get/get.dart';
import 'package:trademale/utilities/constants.dart';

import '../api/apiClient.dart';

class SuppliersRepo extends GetxService {
  final ApiClient apiClient;

  SuppliersRepo({required this.apiClient});

  Future<Response> getSuppliersList() async {
    return await apiClient.getData(kGetSuppliers);
  }

  Future<Response> getSupplierDetails(String supplierId) async {
    return await apiClient.getData(kGetSupplierIdUri + supplierId);
  }
}
