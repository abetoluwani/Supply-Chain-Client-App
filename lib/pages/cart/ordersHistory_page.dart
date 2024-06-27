import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/history_controller.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/orderHistoryItem.dart';

import '../../widgets/TabBar_button.dart';
import '../../widgets/app_icon.dart';

class OrdersHistoryPage extends StatefulWidget {
  const OrdersHistoryPage({super.key});

  @override
  State<OrdersHistoryPage> createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int activeTabIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        activeTabIndex = _tabController!.index;
      });
    });

    // The 'vsync' argument should typically be a TickerProvider, like 'this' for StatefulWidget.
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<HistoryController>().getHistoryList();
    return SafeArea(
      child: Scaffold(body: GetBuilder<HistoryController>(
        builder: (historyController) {
          return historyController.isLoaded
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
                            'Order History',
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
                      Expanded(
                        child: Container(
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                TabBar(
                                    indicatorColor: Colors.transparent,
                                    controller: _tabController,
                                    tabs: tabs = [
                                      TabBarButton(
                                        text: 'Canceled',
                                        width: Dimension.width50 * 2,
                                        height: Dimension.height20 * 2,
                                        backgroundColor: activeTabIndex == 0
                                            ? Color(0xffe5989b)
                                            : Colors.white,
                                      ),
                                      TabBarButton(
                                        text: 'Pending',
                                        width: Dimension.width50 * 2,
                                        height: Dimension.height20 * 2,
                                        backgroundColor: activeTabIndex == 1
                                            ? Color(0xffe5989b)
                                            : Colors.white,
                                      ),
                                      TabBarButton(
                                        text: 'Accepted',
                                        width: Dimension.width50 * 2,
                                        height: Dimension.height20 * 2,
                                        backgroundColor: activeTabIndex == 2
                                            ? Color(0xffe5989b)
                                            : Colors.white,
                                      )
                                    ]),
                                Expanded(child: GetBuilder<HistoryController>(
                                  builder: (historyController) {
                                    return TabBarView(
                                      controller: _tabController,
                                      children: [
                                        RefreshIndicator(
                                          onRefresh: () async {
                                            return await historyController
                                                .getHistoryList();
                                          },
                                          child: ListView.builder(
                                            itemCount: historyController
                                                .historyList.length,
                                            itemBuilder: (context, index) {
                                              // Use index to access each item in your data list

                                              return historyController
                                                          .historyList[index]
                                                          .status ==
                                                      'cancel'
                                                  ? OrderHistoryItem(
                                                      orderId: historyController
                                                          .historyList[index]
                                                          .id,
                                                      created_at:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .created_at,
                                                      client_id:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .client_id,
                                                      supplier: Get.find<
                                                                  SuppliersController>()
                                                              .findSupplierById(
                                                                  historyController
                                                                      .historyList[
                                                                          index]
                                                                      .supplier_id) ??
                                                          '',
                                                      Expected_delivery_date:
                                                          historyController
                                                                  .historyList[
                                                                      index]
                                                                  .Expected_delivery_date ??
                                                              '',
                                                      status: historyController
                                                          .historyList[index]
                                                          .status,
                                                      total: historyController
                                                          .historyList[index]
                                                          .total,
                                                    )
                                                  : Container();
                                            },
                                          ),
                                        ),
                                        RefreshIndicator(
                                          onRefresh: () async {
                                            return await historyController
                                                .getHistoryList();
                                          },
                                          child: ListView.builder(
                                            itemCount: historyController
                                                .historyList.length,
                                            itemBuilder: (context, index) {
                                              // Use index to access each item in your data list
                                              return historyController
                                                          .historyList[index]
                                                          .status ==
                                                      'pending'
                                                  ? OrderHistoryItem(
                                                      orderId: historyController
                                                          .historyList[index]
                                                          .id,
                                                      created_at:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .created_at,
                                                      client_id:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .client_id,
                                                      supplier: Get.find<
                                                                  SuppliersController>()
                                                              .findSupplierById(
                                                                  historyController
                                                                      .historyList[
                                                                          index]
                                                                      .supplier_id) ??
                                                          '',
                                                      Expected_delivery_date:
                                                          historyController
                                                                  .historyList[
                                                                      index]
                                                                  .Expected_delivery_date ??
                                                              '',
                                                      status: historyController
                                                          .historyList[index]
                                                          .status,
                                                      total: historyController
                                                          .historyList[index]
                                                          .total,
                                                    )
                                                  : Container();
                                            },
                                          ),
                                        ),
                                        RefreshIndicator(
                                          onRefresh: () async {
                                            return await historyController
                                                .getHistoryList();
                                          },
                                          child: ListView.builder(
                                            itemCount: historyController
                                                .historyList.length,
                                            itemBuilder: (context, index) {
                                              // Use index to access each item in your data list
                                              return historyController
                                                          .historyList[index]
                                                          .status ==
                                                      "accept"
                                                  ? OrderHistoryItem(
                                                      orderId: historyController
                                                          .historyList[index]
                                                          .id,
                                                      created_at:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .created_at,
                                                      client_id:
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .client_id,
                                                      supplier: Get.find<
                                                                  SuppliersController>()
                                                              .findSupplierById(
                                                                  historyController
                                                                      .historyList[
                                                                          index]
                                                                      .supplier_id) ??
                                                          '',
                                                      Expected_delivery_date:
                                                          historyController
                                                                  .historyList[
                                                                      index]
                                                                  .Expected_delivery_date ??
                                                              '',
                                                      status: historyController
                                                          .historyList[index]
                                                          .status,
                                                      total: historyController
                                                          .historyList[index]
                                                          .total,
                                                    )
                                                  : Container();
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
