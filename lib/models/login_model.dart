class LoginModel {
  bool? success;
  int? serverCode;
  String? message;
  Data? data;

  LoginModel({this.success, this.serverCode, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? code;
  String? message;
  String? username;
  String? userId;
  String? token;

  Data({this.code, this.message, this.username, this.userId, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['Message'];
    username = json['Username'];
    userId = json['UserId'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['Message'] = this.message;
    data['Username'] = this.username;
    data['UserId'] = this.userId;
    data['Token'] = this.token;
    return data;
  }
}
