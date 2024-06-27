import 'package:trademale/models/products_Model.dart';

class Suppliers {
  late List<SupplierModel> _suppliers;

  List<SupplierModel> get suppliers => _suppliers;

  Suppliers({required suppliers}) {
    _suppliers = suppliers;
  }

  Suppliers.fromJson(List<dynamic> json) {
    _suppliers = <SupplierModel>[]; // creat an empty list of ProductModel
    for (int i = 0; i < json.length; i++) {
      _suppliers!.add(SupplierModel.fromJson(json[i]));
    }
    // print(_products);
  }
}

class SupplierModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? commercialRegisterNumber;
  String? phone;
  String? commercialRegisterImage;
  String? companyImage;
  String? category;
  List<ProductModel>? products; // Add a list of ProductModel

  SupplierModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.commercialRegisterNumber,
    required this.phone,
    required this.commercialRegisterImage,
    required this.companyImage,
    required this.category,
    this.products, // Initialize in constructor
  });

  SupplierModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null; //DateTime.tryParse(json['email_verified_at'])!;
    commercialRegisterNumber = json['commercial_register_number'];
    phone = json['phone'];
    commercialRegisterImage = json['commercial_register_image'];
    companyImage = json['company_image'];
    category = json['category'];
    // Parse products if they exist
    if (json['products'] != null) {
      products = List<ProductModel>.from(
          json['products'].map((product) => ProductModel.fromJson(product)));
    }
  }
}
