class SignUpModel {
  String name;
  String email;
  String phone;
  String password;
  String city;
  String region;
  String street;
  String description;

  SignUpModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.city,
      required this.region,
      required this.street,
      required this.description});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["phone"] = this.phone;
    data["password"] = this.password;
    data["city"] = this.city;
    data["region"] = this.region;
    data["street"] = this.street;
    data["description"] = this.description;

    return data;
  }
}
