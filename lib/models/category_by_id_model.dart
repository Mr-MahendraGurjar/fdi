class CategoryByAreaIdModel {
  bool? success;
  int? serverCode;
  String? message;
  List<CategoryData>? data;

  CategoryByAreaIdModel(
      {this.success, this.serverCode, this.message, this.data});

  CategoryByAreaIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  String? categoryId;
  String? categoryName;

  CategoryData({this.categoryId, this.categoryName});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryId'] = categoryId;
    data['CategoryName'] = categoryName;
    return data;
  }
}
