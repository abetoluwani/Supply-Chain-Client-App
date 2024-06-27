class PaginatedProducts {
  late List<ProductModel> products;
  int? currentPage;
  int? lastPage;
  int? total;
  String? nextPageUrl;
  String? prevPageUrl;

  PaginatedProducts({
    required this.products,
    this.currentPage,
    this.lastPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  PaginatedProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <ProductModel>[];
      json['data'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    total = json['total'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }
}

class ProductModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  int? quantity;
  String? categoryId;
  int? supplierId;
  int? price;
  int? pPrice;
  String? imageUrl; // Updated to store only the URL of the first image

  ProductModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.quantity,
    this.categoryId,
    this.supplierId,
    this.price,
    this.pPrice,
    this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    price = json['price'];
    pPrice = json['p_price'];

    // Check if the 'images' list is not empty and assign the URL of the first image
    if (json['images'] != null && json['images'].isNotEmpty) {
      imageUrl = json['images'][0]['image_url'];
    } else {
      imageUrl = null; // or a default image URL if necessary
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['category_id'] = categoryId;
    data['supplier_id'] = supplierId;
    data['price'] = price;
    data['p_price'] = pPrice;
    data['image_url'] =
        imageUrl; // Ensure this matches how you want to output it

    return data;
  }
}
