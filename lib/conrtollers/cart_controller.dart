import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/models/products_Model.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_Model.dart';
import '../models/order_Model.dart';

class CartController extends GetxController {
  CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> items = {};

  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (items.containsKey(productModel.id!)) {
      items.update(
        productModel.id!,
        (value) {
          //value==productModel that already exist in cart
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            img: value.img,
            name: value.name,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: productModel,
          ); //it return these updates version of cartItem to items above
        },
      );
      if (totalQuantity <= 0) items.remove(productModel.id);
    } else {
      //if the order is new he enter here
      if (quantity > 0) {
        items.putIfAbsent(
          productModel.id!,
          () {
            return CartModel(
              id: productModel.id,
              img: productModel.imageUrl,
              name: productModel.name,
              price: productModel.price,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: productModel,
            );
          },
        );
      } else {
        Get.snackbar(
          "Itme count 😥",
          "You should add at least one item!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  bool existInCart(ProductModel productModel) {
    if (items.containsKey(productModel.id)) {
      return true;
    } else
      return false;
  }

  int getQuantity(ProductModel productModel) {
    var sum = 0;
    if (items.containsKey(productModel.id)) {
      items.forEach((key, value) {
        if (key == productModel.id) sum = value.quantity!;
      });
    }
    return sum;
  }

  int get totalItems {
    var totalItems = 0;
    items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems {
    return items.entries.map(
      (e) {
        return e.value;
      },
    ).toList();
  }

  double get totalAmount {
    double total = 0;
    items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  void clearCart() {
    items.clear();
    update();
  }

  void checkOut() async {
    final items = getItems; // Assuming getItems returns a list of cart items
    List<OneOrderModel> orderItems = [];

    for (var item in items) {
      orderItems.add(
        OneOrderModel(
          productId: item.id.toString(),
          quantity: item.quantity,
          price: item.price,
        ),
      );
    }
    print(orderItems);
    OrderModel order = OrderModel(
        orders: orderItems, supplier_id: items[0].product?.supplierId ?? 0);
    Response response = await cartRepo.checkOut(order);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.leftSlide,
        showCloseIcon: false,
        title: "Great!",
        desc: "Your order is uploaded ",
        btnOkText: "yes",
        btnOkOnPress: () {
          clearCart();
        },
      ).show();
    } else {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.leftSlide,
        showCloseIcon: false,
        title: "Sorry!",
        desc: "Error exist , pleas try again ",
        btnOkText: "ok",
        btnOkOnPress: () {},
      ).show();
    }
  }
}
