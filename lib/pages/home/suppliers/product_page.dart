import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/app_icon.dart';

import '../../../conrtollers/cart_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage(
      {super.key,
      required this.pageId,
      required this.oldPage,
      this.supplierId});

  int pageId;
  String oldPage;
  int? supplierId;

  var price = 250;

  @override
  Widget build(BuildContext context) {
    var product = oldPage == "home"
        ? Get.find<ProductsController>().productsList[pageId]
        : Get.find<SuppliersController>()
            .suppliersList[supplierId!]
            .products[pageId];

    Get.find<ProductsController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              Dimension.height10, Dimension.height10, 0, Dimension.height10),
          height: Dimension.screenHeight,
          width: Dimension.screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              oldPage == 'supplier'
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: AppIcon(
                              backgroundColor: Colors.transparent,
                              iconColor: Color(0xff6d6875),
                              icon: Icons.arrow_back_ios_new_rounded),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        GetBuilder<ProductsController>(
                          builder: (productsController) {
                            return GestureDetector(
                              onTap: () {
                                if (Get.find<ProductsController>().totalItems ==
                                    0) {
                                  Get.toNamed(routeHelper.getHead("0"));
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.topSlide,
                                    showCloseIcon: true,
                                    title: "warning",
                                    desc:
                                        "You have items in Cart, do you want to remove them!",
                                    btnOkText: "yes",
                                    btnOkOnPress: () {
                                      productsController.clearCart();
                                      Get.toNamed(routeHelper.getHead("0"));
                                    },
                                    btnCancelOnPress: () {},
                                  ).show();
                                }
                              },
                              child: AppIcon(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Color(0xff6d6875),
                                  icon: Icons.arrow_back_ios_new_rounded),
                            );
                          },
                        ),
                        Spacer(),
                        GetBuilder<CartController>(
                          builder: (cartController) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(routeHelper.getCart());
                              },
                              child: AppIcon(
                                  backgroundColor: Colors.transparent,
                                  iconColor: cartController.totalItems == 0
                                      ? Color(0xff6d6875)
                                      : Colors.green,
                                  icon: Icons.shopping_cart_rounded),
                            );
                          },
                        ),
                        SizedBox(
                          width: Dimension.height10,
                        )
                      ],
                    ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: Dimension.height50 * 1.5,
                      left: Dimension.width20,
                      child: Container(
                        width: Dimension.width50 * 1.2,
                        height: Dimension.height50 * 1.3,
                        decoration: BoxDecoration(
                          color: Color(0xe56d6875),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimension.radius30 * 0.6),
                            bottomLeft:
                                Radius.circular(Dimension.radius30 * 0.6),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Still',
                              style: TextStyle(
                                  fontFamily: 'Schyler',
                                  fontSize: Dimension.font12 * 1.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  color: Colors.white),
                            ),
                            Text(
                              product.quantity!.toString(),
                              style: TextStyle(
                                  fontSize: Dimension.font12 * 1.5,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimension.height20,
                      left: Dimension.height20 * 4,
                      right: 0,
                      child: Container(
                        width: Dimension.screenWidth,
                        height: Dimension.height50 * 6.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimension.radius30 * 2),
                            bottomLeft: Radius.circular(Dimension.radius30 * 2),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: product.imageUrl == null
                                ? AssetImage('assets/images/cart.jpg')
                                : NetworkImage(
                                        "http://10.0.2.2:8000/${product.imageUrl}")
                                    as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimension.height50 * 6.5,
                      left: Dimension.width50 * 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimension.height10),
                          ),
                          color: Color(0xe56d6875),
                        ),
                        height: Dimension.height20 * 2,
                        width: Dimension.width50 * 2.2,
                        child: GetBuilder<ProductsController>(
                          builder: (productsController) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    productsController.setQuantity(
                                        false, product.quantity!);
                                  },
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: Dimension.font20 * 1.3,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  productsController.inCartItems.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimension.font20,
                                      color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productsController.setQuantity(
                                        true, product.quantity!);
                                  },
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: Dimension.font20,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 0,
                      top: Dimension.height50 * 8,
                      child: Container(
                        height: Dimension.height50 * 5.3,
                        width: Dimension.width50 * 8.4,
                        //color: Colors.greenAccent,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name!,
                                    style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: Dimension.font20 * 1.2,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xff6d6875),
                                    ),
                                  ),
                                  Text(
                                    '\$ ' + product.price.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: Dimension.font20 * 1.2,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xffe5989b),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.categoryId ?? 'All',
                                    style: TextStyle(
                                      fontFamily: 'Schyler',
                                      color: Color(0xff6d6875),
                                    ),
                                  ),
                                  Text(
                                    '\$ ' + product.pPrice.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: Dimension.font20 * 1.2,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DESCRIPTION',
                                    style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: Dimension.font20 * 1.2,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xff6d6875),
                                    ),
                                  ),
                                  GetBuilder<ProductsController>(
                                    builder: (productsController) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          productsController.addItem(product);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(
                                              0xffb5838d), // Background color
                                          foregroundColor:
                                              Colors.white, // Text color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimension
                                                    .radius15), // Border radius
                                            // Border color
                                          ),
                                        ),
                                        child: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                            fontFamily: 'Schyler',
                                            fontSize: Dimension.font20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                              ExpandableText(
                                product.description!,
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6d6875),
                                ),
                                expandText: 'Read more',
                                collapseText: 'Read less',
                                linkColor: Color(0xffe5989b),
                                maxLines: 3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: Dimension.width50 * 8.4,
                        height: Dimension.height50 * 2,
                        // color: Colors.lightBlueAccent,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimension.height10, bottom: 2),
                              width: double.infinity,
                              height: 1,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline_rounded,
                                  size: Dimension.iconSize25,
                                  color: Color(0xffe5989b),
                                ),
                                Text(
                                  ' Original product',
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      color: Color(0xff6d6875),
                                      fontWeight: FontWeight.w400,
                                      fontSize: Dimension.font12 * 1.5),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: Dimension.iconSize25,
                                  color: Color(0xffe5989b),
                                ),
                                Text(
                                  ' Return of goods in 5 days',
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      color: Color(0xff6d6875),
                                      fontWeight: FontWeight.w400,
                                      fontSize: Dimension.font12 * 1.5),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.payment,
                                  size: Dimension.iconSize25,
                                  color: Color(0xffe5989b),
                                ),
                                Text(
                                  ' Pay directly at your place',
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      color: Color(0xff6d6875),
                                      fontWeight: FontWeight.w400,
                                      fontSize: Dimension.font12 * 1.5),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
