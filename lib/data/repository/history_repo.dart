import 'package:get/get_connect/http/src/response/response.dart';
import 'package:trademale/utilities/constants.dart';

import '../api/apiClient.dart';

class HistoryRepo {
  final ApiClient apiClient;

  HistoryRepo({required this.apiClient});

  Future<Response> getHistory() async {
    return await apiClient.getData(kGetOrdersUri);
  }
}
