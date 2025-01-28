class CreateUserModel {
  String? fullName;
  String? email;
  String? password;

  CreateUserModel({this.fullName, this.email, this.password});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
