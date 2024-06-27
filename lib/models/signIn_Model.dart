class SignInModel {
  String email;
  String password;

  SignInModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
