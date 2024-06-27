import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/conrtollers/watchList_controller.dart';
import 'package:trademale/models/products_Model.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/productItem_watchPage.dart';

import '../../conrtollers/suppliers_controller.dart';
import '../../widgets/app_icon.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Get.find<WatchListController>().getWatchList();
    return SafeArea(
      child: Scaffold(body: GetBuilder<WatchListController>(
        builder: (watchListController) {
          return watchListController.watchListIsLoaded
              ? Container(
                  margin: EdgeInsets.fromLTRB(
                    Dimension.height10,
                    Dimension.height10,
                    Dimension.height10,
                    Dimension.height10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(routeHelper.getHead("0"));
                            },
                            child: AppIcon(
                                backgroundColor: Colors.transparent,
                                iconColor: Color(0xff6d6875),
                                icon: Icons.arrow_back_ios_new_rounded),
                          ),
                          SizedBox(
                            width: Dimension.width50 * 2,
                          ),
                          Text(
                            'Watch List',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: Dimension.font26,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff5f5a5a),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimension.height50,
                      ),
                      Expanded(child: GetBuilder<WatchListController>(
                        builder: (watchListController) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of products in a row
                              crossAxisSpacing: Dimension.width10,
                              mainAxisSpacing: Dimension.height10,
                            ),
                            itemCount: watchListController.productsList.length,
                            itemBuilder: (context, index) {
                              if (true) {
                                print(watchListController.productsList.length);
                                ProductModel product =
                                    Get.find<ProductsController>()
                                        .watchListUseOnly
                                        .firstWhere((product) =>
                                            product.id ==
                                            watchListController
                                                .productsList[index]);

                                return ProductItemWatchList(
                                  id: product.id!,
                                  productName: product.name!,
                                  supplierName: Get.find<SuppliersController>()
                                          .findSupplierById(
                                              product.supplierId!) ??
                                      '',
                                  imagePath: product.imageUrl == null
                                      ? AssetImage('assets/images/cart.jpg')
                                      : NetworkImage(
                                              "http://10.0.2.2:8000/${product.imageUrl}")
                                          as ImageProvider,
                                  updatedAt: product.updatedAt.toString(),
                                  buyPrice: product.price!,
                                  sellPrice: product.pPrice ?? 0,
                                );
                              }
                            },
                            controller: _scrollController,
                          );
                        },
                      )),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
