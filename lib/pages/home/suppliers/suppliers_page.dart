import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/data/repository/suppliers_repo.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../../conrtollers/suppliers_controller.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/supplierItem.dart';

class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Consider initializing the SuppliersController here if not already done elsewhere in your app
    final SuppliersController suppliersController =
        Get.put(SuppliersController(suppliersRepo: Get.find<SuppliersRepo>()));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimension.height10, top: Dimension.height10),
              height: Dimension.height50 * 2.4,
              width: double.infinity,
              color: Color(0x33de1b25),
              child: Column(
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimension.width5,
                      right: Dimension.width12,
                    ),
                    height: Dimension.height20 * 2.1,
                    decoration: BoxDecoration(
                      color: Color(0x1e767680),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        // Directly call the filterSuppliers method from SuppliersController
                        suppliersController.filterSuppliers(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Color(0xff5f5a5a),
                        suffixIconColor: Color(0xff5f5a5a),
                        suffixIcon: GestureDetector(
                          onLongPress: () {
                            // Handle microphone button tap here
                            print('Microphone button tapped');
                          },
                          child: Icon(Icons.mic_sharp),
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(fontSize: Dimension.font12 * 1.1),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimension.height10,
                    Dimension.height10, Dimension.height10, Dimension.height10),
                child: GetBuilder<SuppliersController>(
                  builder: (controller) {
                    return controller.sListIsLoaded
                        ? ListView.builder(
                            itemCount: controller.suppliersList.length,
                            itemBuilder: (context, index) {
                              var supplier = controller.suppliersList[index];
                              return GestureDetector(
                                onTap: () async {
                                  await controller
                                      .getSupplierDetails(supplier.id);
                                  Get.toNamed(routeHelper.getSupplier(index));
                                },
                                child: SupplierItem(
                                  title: supplier.name,
                                  subtitle: supplier.category,
                                  imagePath: supplier.companyImage == null
                                      ? AssetImage('assets/images/ph1.png')
                                      : NetworkImage(
                                              "http://10.0.2.2:8000${supplier.companyImage}")
                                          as ImageProvider,
                                  email: supplier.email,
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffe5989b),
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
