import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/widgets/productItemCartPage.dart';

import '../../conrtollers/cart_controller.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(Dimension.height10, Dimension.height10,
              Dimension.height10, Dimension.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Get.find<ProductsController>().totalItems == 0) {
                        Get.find<ProductsController>().clearCart();

                        Navigator.pop(context);
                      } else {
                        Get.snackbar(
                          "warnning! 🙅",
                          "you cant leave , check out or cancel your order",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        return AppIcon(
                            backgroundColor: Colors.transparent,
                            iconColor: Color(0xff6d6875),
                            icon: Icons.arrow_back_ios_new_rounded);
                      },
                    ),
                  ),
                  Text(
                    'My Cart',
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w400,
                        fontSize: Dimension.font26,
                        color: Color(0xff5f5a5a),
                        letterSpacing: 2),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Positioned(
                          child: Icon(
                            Icons.shopping_cart,
                            size: Dimension.iconSize25 * 1.6,
                            color: Color(0xff5f5a5a),
                          ),
                        ),
                        GetBuilder<CartController>(
                          builder: (cartController) {
                            return cartController.getItems.length > 0
                                ? Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Color(0xffe5989b),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        cartController.getItems.length
                                            .toString(),
                                        // Replace with the actual count of items in the cart
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, Dimension.height10, 0, Dimension.height10),
                    height: Dimension.screenHeight / 1.8,
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        return ListView.builder(
                          itemCount: cartController.getItems.length,
                          itemBuilder: (context, index) {
                            return ProductItemCartPage(
                              title: cartController.getItems[index].name!,
                              subtitle: cartController.getItems[index].time!,
                              price:
                                  '\$ ${cartController.getItems[index].price}',
                              imagePath: cartController.getItems[index].img ==
                                      null
                                  ? AssetImage('assets/images/cart.jpg')
                                  : NetworkImage(
                                          "http://10.0.2.2:8000/${cartController.getItems[index].img}")
                                      as ImageProvider,
                              quantity:
                                  cartController.getItems[index].quantity!,
                              onAdd: () {
                                cartController.addItem(
                                    cartController.getItems[index].product!, 1);
                              },
                              onRemove: () {
                                cartController.addItem(
                                    cartController.getItems[index].product!,
                                    -1);
                              },
                              onDelete: () {
                                cartController.addItem(
                                    cartController.getItems[index].product!,
                                    -cartController.getItems[index].quantity!);
                              },
                            );
                          },
                        );
                      },
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: Dimension.height10, bottom: 2),
                width: double.infinity,
                height: 1,
                color: Color(0xff6d6875),
              ),
              Text(
                'Order Info',
                style: TextStyle(
                  fontSize: Dimension.font26,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff6d6875),
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              GetBuilder<CartController>(
                builder: (cartController) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: TextStyle(
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                          Text(
                            '\$ ${cartController.totalAmount}',
                            style: TextStyle(
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery fee',
                            style: TextStyle(
                              height: 2.3,
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                          Text(
                            '\$ 0',
                            style: TextStyle(
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                          Text(
                            '0%',
                            style: TextStyle(
                              fontSize: Dimension.font12 * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6d6875),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              letterSpacing: 2,
                              height: 3,
                              fontSize: Dimension.font20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff6d6875),
                            ),
                          ),
                          Text(
                            cartController.totalAmount == 0
                                ? '\$ 0'
                                //: '\$ ${(cartController.totalAmount + 7) - (cartController.totalAmount * 0.05)}',
                                : '\$ ${cartController.totalAmount}',
                            style: TextStyle(
                              fontSize: Dimension.font20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff6d6875),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (cartController.totalAmount > 0) {
                            cartController.checkOut();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cartController.totalAmount == 0
                              ? Colors.grey
                              : Color(0xffb5838d),
                          // Background color
                          foregroundColor: Colors.white,
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Dimension.radius15), // Border radius
                            // Border color
                          ),
                        ),
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: Dimension.font20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
