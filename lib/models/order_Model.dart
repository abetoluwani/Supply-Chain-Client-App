class OrderModel {
  List<OneOrderModel> orders;
  int supplier_id;

  OrderModel({required this.orders, required this.supplier_id});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> ordersJson =
        this.orders.map((order) => order.toJson()).toList();
    return {
      "order": ordersJson,
      "supplier_id": supplier_id,
    };
  }
}

class OneOrderModel {
  String productId;
  int? quantity;
  int? price;

  OneOrderModel({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'price': price,
    };
  }
}
