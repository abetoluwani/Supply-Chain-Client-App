import 'package:get/get.dart';

import '../data/repository/history_repo.dart';
import '../models/History_Model.dart';

class HistoryController extends GetxController {
  HistoryRepo historyRepo;

  HistoryController({required this.historyRepo});

  List<dynamic> _historyList = [];

  List<dynamic> get historyList => _historyList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getHistoryList() async {
    Response response = await historyRepo.getHistory();
    if (response.statusCode == 200) {
      _historyList = []; //you have to make it empty to avoid repetition
      _historyList.addAll(Histories.fromJson(response.body).histories);
      _isLoaded = true;
      update(); //is something like setState to update ui
    } else {}
  }
}
