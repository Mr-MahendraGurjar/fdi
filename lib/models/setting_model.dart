class SettingModel {
  bool? success;
  int? serverCode;
  String? message;
  List<Data>? data;

  SettingModel({this.success, this.serverCode, this.message, this.data});

  SettingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool? isActive;
  String? nameClientId;
  String? locationClientId;
  String? presentClient;

  Data(
      {this.isActive,
        this.nameClientId,
        this.locationClientId,
        this.presentClient});

  Data.fromJson(Map<String, dynamic> json) {
    isActive = json['IsActive'];
    nameClientId = json['NameClient_Id'];
    locationClientId = json['LocationClient_Id'];
    presentClient = json['PresentClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsActive'] = this.isActive;
    data['NameClient_Id'] = this.nameClientId;
    data['LocationClient_Id'] = this.locationClientId;
    data['PresentClient'] = this.presentClient;
    return data;
  }
}
