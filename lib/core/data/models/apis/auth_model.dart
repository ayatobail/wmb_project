class LogInModel {
  String? message;
  late bool isAdmin;

  LogInModel({this.message, required this.isAdmin});

  LogInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}


class SignUpModel {
  int? id;
  String? username;
  String? password;
  String? fName;
  String? lName;
  String? address;
  String? email;
  Null? invoices;

  SignUpModel(
      {this.id,
        this.username,
        this.password,
        this.fName,
        this.lName,
        this.address,
        this.email,
        this.invoices});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    fName = json['fName'];
    lName = json['lName'];
    address = json['address'];
    email = json['email'];
    invoices = json['invoices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['invoices'] = this.invoices;
    return data;
  }
}