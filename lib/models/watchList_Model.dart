import 'dart:convert';

class WatchListModel {
  List<int>? productIds;

  WatchListModel({this.productIds});

  Map<String, dynamic> toJson() {
    return {
      'product_list': productIds,
    };
  }

  WatchListModel.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] is String) {
      // If the product_list is a string, decode it as JSON
      var productListString = json['product_list'] as String;
      productIds = jsonDecode(productListString).cast<int>();
    } else if (json['product_list'] is List) {
      // Directly cast the list to a List<int> if that's what it is
      productIds = List<int>.from(json['product_list']
          .map((item) => int.tryParse(item.toString()) ?? 0)
          .where((item) => item != 0));
    }
  }
}
