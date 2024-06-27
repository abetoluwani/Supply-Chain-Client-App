import 'package:get/get.dart';
import 'package:trademale/utilities/constants.dart';

import '../api/apiClient.dart';

class WatchListRepo extends GetxService {
  final ApiClient apiClient;

  WatchListRepo({required this.apiClient});

  Future<Response> getWatchList() async {
    return await apiClient.getData(kGetWatchListUri);
  }

  Future<Response> updateWatchList(dynamic data) async {
    return await apiClient.postData(kPostWatchListUri, data);
  }
}
