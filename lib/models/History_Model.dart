class Histories {
  late List<HistoryModel> _histories;

  List<HistoryModel> get histories =>
      _histories; //to access products form out of class

  Histories({required products}) {
    _histories = products;
  }

  Histories.fromJson(List<dynamic> json) {
    _histories = <HistoryModel>[]; // creat an empty list of ProductModel
    for (int i = 0; i < json.length; i++) {
      _histories!.add(HistoryModel.fromJson(json[i]));
    }
  }
}

class HistoryModel {
  int? id;
  String? created_at;
  String? updated_at;
  String? status;
  int? total;
  int? supplier_id;
  DateTime? Expected_delivery_date;
  int? client_id;

  HistoryModel(
      {this.id,
      this.supplier_id,
      this.total,
      this.created_at,
      this.client_id,
      this.updated_at,
      this.Expected_delivery_date,
      this.status});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplier_id = json['supplier_id'];
    total = json['total'];
    created_at = json['created_at'];
    client_id = json['client_id'];
    updated_at = json['updated_at'];
    Expected_delivery_date = json['Expected_delivery_date'];
    status = json['status'];
  }
}
