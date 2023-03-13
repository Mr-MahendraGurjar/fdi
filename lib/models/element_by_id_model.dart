class ElementByIdModel {
  bool? success;
  int? serverCode;
  String? message;
  List<ElementData>? data;

  ElementByIdModel({this.success, this.serverCode, this.message, this.data});

  ElementByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ElementData>[];
      json['data'].forEach((v) {
        data!.add(new ElementData.fromJson(v));
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

class ElementData {
  int? id;
  String? elementTypeId;
  String? elementTypeValue;
  int? sortOrder;

  ElementData({this.id, this.elementTypeId, this.elementTypeValue, this.sortOrder});

  ElementData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    elementTypeId = json['ElementTypeId'];
    elementTypeValue = json['ElementTypeValue'];
    sortOrder = json['SortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ElementTypeId'] = this.elementTypeId;
    data['ElementTypeValue'] = this.elementTypeValue;
    data['SortOrder'] = this.sortOrder;
    return data;
  }
}
