import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../../widgets/app_icon.dart';
import '../../../widgets/productItem_supplierPage.dart';

class SupplierPage extends StatefulWidget {
  int pageId;

  SupplierPage({super.key, required this.pageId});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  @override
  Widget build(BuildContext context) {
    var supplier = Get.find<SuppliersController>().suppliersList[widget.pageId];
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SuppliersController>(builder: (supplierController) {
          return Stack(
            children: [
              //image of company
              Positioned(
                left: 0,
                right: 0,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.transparent],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.colorBurn,
                  child: Container(
                    width: double.infinity,
                    height: Dimension.height50 * 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: supplier.companyImage == null
                            ? AssetImage('assets/images/cart.jpg')
                            : NetworkImage(
                                    "http://10.0.2.2:8000${supplier.companyImage}")
                                as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ),
              //company name
              Positioned(
                left: 0,
                right: 0,
                top: Dimension.height50 * 3.4,
                child: Center(
                  child: Text(
                    supplier.name,
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w900,
                        fontSize: Dimension.font20,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                ),
              ),
              //go back button
              Positioned(
                left: Dimension.width10,
                top: Dimension.height10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: AppIcon(
                        backgroundColor: Colors.white,
                        iconColor: Color(0xff6d6875),
                        icon: Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: Dimension.width15,
                top: Dimension.height10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(routeHelper.getCart());
                      },
                      child: AppIcon(
                        backgroundColor: Colors.white,
                        iconColor: Color(0xff6d6875),
                        icon: Icons.shopping_cart_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              //search and add to favorite (not working)
              Positioned(
                left: Dimension.width10,
                top: Dimension.height50 * 4.3,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimension.width5,
                        right: Dimension.width12,
                      ),
                      height: Dimension.height20 * 1.8,
                      width: Dimension.width50 * 7,
                      decoration: BoxDecoration(
                        color: Color(0x1e767680),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Color(0xff5f5a5a),
                          suffixIconColor: Color(0xff5f5a5a),
                          suffixIcon: GestureDetector(
                            onLongPress: () {
                              print('Microphone button tapped');
                            },
                            child: Icon(Icons.mic_sharp),
                          ),
                          hintText: 'Search...',
                          hintStyle:
                              TextStyle(fontSize: Dimension.font12 * 1.1),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                          size: Dimension.iconSize40,
                          color: Color(0xffb5838d),
                          Icons.add),
                    ),
                  ],
                ),
              ),
              //list of products
              Positioned(
                right: Dimension.width5,
                left: Dimension.width5,
                top: Dimension.height50 * 5.3,
                child: SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(
                        Dimension.height10,
                        Dimension.height10,
                        Dimension.height10,
                        Dimension.height10,
                      ),
                      height: Dimension.height50 * 10.7,
                      child: supplier.products == null ||
                              supplier.products.isEmpty
                          ? Center(
                              child: Text(
                                'No products , stay around !',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : ListView.builder(
                              itemCount: supplier.products.length > 1
                                  ? supplier.products.length
                                  : 0,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(routeHelper.getProductDetails(
                                        index, "supplier",
                                        supplierId: widget.pageId));
                                  },
                                  child: ProductItemSupplierPage(
                                    title: supplier.products[index].name,
                                    description:
                                        supplier.products[index].categoryId ??
                                            "All",
                                    imagePath: supplier
                                                .products[index].imageUrl ==
                                            null
                                        ? AssetImage('assets/images/cart.jpg')
                                        : NetworkImage(
                                                "http://10.0.2.2:8000/${supplier.products[index].imageUrl}")
                                            as ImageProvider,
                                    price: supplier.products[index].price ?? 0,
                                    pPrice:
                                        supplier.products[index].pPrice ?? 0,
                                  ),
                                );
                              },
                            )),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
