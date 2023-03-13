class FloorModel {
  bool? success;
  int? serverCode;
  String? message;
  Data? data;

  FloorModel({this.success, this.serverCode, this.message, this.data});

  FloorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  int? count;
  List<FloorData>? rows;

  Data({this.count, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = <FloorData>[];
      json['rows'].forEach((v) {
        rows!.add(FloorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FloorData {
  String? id;
  String? floorName;
  String? floorNameAbv;
  int? sortOrder;

  FloorData({this.id, this.floorName, this.floorNameAbv, this.sortOrder});

  FloorData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    floorName = json['FloorName'];
    floorNameAbv = json['FloorNameAbv'];
    sortOrder = json['SortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['FloorName'] = this.floorName;
    data['FloorNameAbv'] = this.floorNameAbv;
    data['SortOrder'] = this.sortOrder;
    return data;
  }
}
