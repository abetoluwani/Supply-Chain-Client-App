import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/data/repository/Products_repo.dart';
import 'package:trademale/models/products_Model.dart';

import '../models/cart_Model.dart';
import 'cart_controller.dart';

class ProductsController extends GetxController {
  final ProductsRepo productsRepo;

  ProductsController({required this.productsRepo});

  List<ProductModel> _productsList = [];
  List<ProductModel> _filteredProductsList =
      []; // Added for search functionality

  List<ProductModel> get productsList =>
      _filteredProductsList.isNotEmpty ? _filteredProductsList : _productsList;

  List<ProductModel> get watchListUseOnly => _productsList;

  bool _pListIsLoaded = false;

  bool get pListIsLoaded => _pListIsLoaded;

  int _currentPage = 1;
  int _lastPage = 1;

  bool get canLoadMore => _currentPage < _lastPage;

  int quantity = 0;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems + quantity;

  late CartController cartController;

  Future<void> getProductsList() async {
    if (canLoadMore || _currentPage == 1) {
      // Check if more products can be loaded
      Response response =
          await productsRepo.getProductsListByPage(_currentPage);
      if (response.statusCode == 200) {
        var paginatedProducts = PaginatedProducts.fromJson(response.body);
        if (_currentPage == 1) {
          _productsList = paginatedProducts
              .products; // Replace existing products for the first page
        } else {
          _productsList.addAll(paginatedProducts
              .products); // Append products for subsequent pages
        }
        _currentPage =
            paginatedProducts.currentPage! + 1; // Prepare for the next page
        _lastPage = paginatedProducts.lastPage!;
        _pListIsLoaded = true;
        update(); // Update the UI
      } else {
        print("Error: ${response.statusCode}");
      }
    }
  }

  void loadMoreProducts() {
    if (canLoadMore) {
      getProductsList(); // Load next page
    }
  }

  void setQuantity(bool isIncrement, int still) {
    if (isIncrement) {
      quantity = checkQuantity(quantity + 1, still);
    } else {
      quantity = checkQuantity(quantity - 1, still);
    }
    update();
  }

  int checkQuantity(int quantity, int still) {
    if ((_inCartItems + quantity) > still) {
      Get.snackbar(
        "Itme count 🙅",
        "you can't add more",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return still;
    } else if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Itme count 🙅",
        "you can't reduce more",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        quantity = -_inCartItems;
        return quantity;
      }
      return 0;
    } else
      return quantity;
  }

  void initProduct(ProductModel productModel, CartController cartController) {
    quantity = 0;
    _inCartItems = 0;
    this.cartController = cartController;
    var exist = cartController.existInCart(productModel);
    if (exist) _inCartItems = cartController.getQuantity(productModel);
    // print(
    //     "the quantity of this ${productModel.id} is : ${_inCartItems.toString()}");
    //print("exist or not : $exist");
  }

  void addItem(ProductModel productModel) {
    cartController.addItem(productModel, quantity);
    quantity = 0;
    _inCartItems = cartController.getQuantity(productModel);
    // cartController.items.forEach(
    //   (key, value) {
    //     print("id is ${value.id} and quantity is ${value.quantity}");
    //   },
    //);
    update();
  }

  int get totalItems {
    return cartController.totalItems;
  }

  List<CartModel> get getItems {
    return cartController.getItems;
  }

  void clearCart() {
    cartController.clearCart();
    update();
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProductsList = [];
    } else {
      _filteredProductsList = _productsList.where((product) {
        return product.name!.toLowerCase().contains(query.toLowerCase()) ||
            product.description!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    update(); // Update the UI with the search results
  }
}
