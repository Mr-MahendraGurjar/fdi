class ElementByAreaIdModel {
  bool? success;
  int? serverCode;
  String? message;
  List<ElementData>? data;

  ElementByAreaIdModel(
      {this.success, this.serverCode, this.message, this.data});

  ElementByAreaIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ElementData>[];
      json['data'].forEach((v) {
        data!.add(ElementData.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ElementTypeId'] = elementTypeId;
    data['ElementTypeValue'] = elementTypeValue;
    data['SortOrder'] = sortOrder;
    return data;
  }
}
