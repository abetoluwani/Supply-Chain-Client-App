import 'package:get/get.dart';

import '../data/repository/watchList_repo.dart';
import '../models/watchList_Model.dart';

class WatchListController extends GetxController {
  final WatchListRepo watchListRepo;

  WatchListController({required this.watchListRepo});

  List<int> _productsList = [];

  List<int> get productsList => _productsList;

  bool _watchListIsLoaded = false;

  bool get watchListIsLoaded => _watchListIsLoaded;

  Future<void> getWatchList() async {
    Response response = await watchListRepo.getWatchList();
    if (response.statusCode == 200) {
      WatchListModel watchListModel = WatchListModel.fromJson(response.body);
      _productsList = watchListModel.productIds ?? [];
      _watchListIsLoaded = true;
      update(); // Notify listeners to update the UI
    } else {
      // Handle error or invalid response
    }
  }

  // Add an ID to the watchlist and post it
  Future<void> addToWatchList(int productId) async {
    if (!_productsList.contains(productId)) {
      _productsList.add(productId);
      await updateWatchList();
    }
    update();
  }

  Future<void> removeWatchListItem(int productId) async {
    _productsList.remove(productId);
    print("productsList is${_productsList}");
    await updateWatchList();
    _watchListIsLoaded = true;
    update();
  }

  Future<bool> updateWatchList() async {
    WatchListModel watchListModel = WatchListModel(productIds: _productsList);
    Response response =
        await watchListRepo.updateWatchList(watchListModel.toJson());
    print("response status of post remove is${response.statusCode}");
    print("response of post remove is ${response.body}");
    await watchListRepo.getWatchList();
    return response.statusCode == 200;
  }
}
