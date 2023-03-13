class AreaByCategoryModel {
  bool? success;
  int? serverCode;
  String? message;
  List<AreaData>? data;

  AreaByCategoryModel({this.success, this.serverCode, this.message, this.data});

  AreaByCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaData>[];
      json['data'].forEach((v) {
        data!.add(AreaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['serverCode'] = serverCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaData {
  int? id;
  String? name;
  String? abbreviation;
  bool? active;
  int? moduleId;

  AreaData({this.id, this.name, this.abbreviation, this.active, this.moduleId});

  AreaData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    abbreviation = json['Abbreviation'];
    active = json['Active'];
    moduleId = json['ModuleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Abbreviation'] = abbreviation;
    data['Active'] = active;
    data['ModuleId'] = moduleId;
    return data;
  }
}
