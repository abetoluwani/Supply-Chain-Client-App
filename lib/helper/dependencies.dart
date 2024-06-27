import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/conrtollers/history_controller.dart';
import 'package:trademale/conrtollers/signUp_controller.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/conrtollers/watchList_controller.dart';
import 'package:trademale/data/repository/Products_repo.dart';
import 'package:trademale/data/repository/cart_repo.dart';
import 'package:trademale/data/repository/history_repo.dart';
import 'package:trademale/data/repository/signUp_repo.dart';
import 'package:trademale/data/repository/suppliers_repo.dart';
import 'package:trademale/data/repository/watchList_repo.dart';

import '../conrtollers/cart_controller.dart';
import '../conrtollers/signIn_controller.dart';
import '../data/api/apiClient.dart';
import '../data/repository/signIn_repo.dart';
import '../utilities/constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: kBaseUrl));
//repos
  Get.lazyPut(() => HistoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductsRepo(apiClient: Get.find()));
  Get.lazyPut(() => SuppliersRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(apiClient: Get.find()));
  Get.lazyPut(() => SignUpRepo(apiClient: Get.find()));
  Get.lazyPut(() => SignInRepo(apiClient: Get.find()));
  Get.lazyPut(() => WatchListRepo(apiClient: Get.find()));

//controllers
  Get.lazyPut(() => HistoryController(historyRepo: Get.find()));
  Get.lazyPut(() => ProductsController(productsRepo: Get.find()));
  Get.lazyPut(() => SuppliersController(suppliersRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => SignUpController(signUpRepo: Get.find()));
  Get.lazyPut(() => SignInController(signInRepo: Get.find()));
  Get.lazyPut(() => WatchListController(watchListRepo: Get.find()));
}
