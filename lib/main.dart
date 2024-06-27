import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trademale/utilities/routeHelper.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await dep.init();
  //these lines for get save the token from rom to app ram ..
  // Box box = await Hive.openBox('myBox');
  // var token = await box.get(kToken);
  // if(token!=null){
  //   Get.find<SignInRepo>().saveUserToken(token);
  //
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<ProductsController>().getProductsList();
    // Get.find<SuppliersController>().getSuppliersList();
    // Get.find<CartController>();
    // Get.find<SignUpController>();
    // Get.find<SignInController>();
    // Get.find<HistoryController>().getHistoryList();
    // Get.find<WatchListController>().getWatchList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: routeHelper.routes,
      initialRoute: routeHelper.getSplash(),
    );
  }
}
