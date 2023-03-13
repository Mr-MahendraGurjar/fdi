class ToonAuditModel {
  bool? success;
  int? serverCode;
  String? message;
  List<CategoryList>? data;

  ToonAuditModel({this.success, this.serverCode, this.message, this.data});

  ToonAuditModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryList>[];
      json['data'].forEach((v) {
        data!.add(new CategoryList.fromJson(v));
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

class CategoryList {
  String? auditCode;
  String? companyName;
  String? type;
  String? locationName;
  String? categoryId;
  String? categoryName;
  int? minimunSizeRange;
  int? maximunSizeRange;
  int? approvedLimit;

  CategoryList(
      {this.auditCode,
        this.companyName,
        this.type,
        this.locationName,
        this.categoryId,
        this.categoryName,
        this.minimunSizeRange,
        this.maximunSizeRange,
        this.approvedLimit});

  CategoryList.fromJson(Map<String, dynamic> json) {
    auditCode = json['AuditCode'];
    companyName = json['CompanyName'];
    type = json['Type'];
    locationName = json['Location_Name'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
    minimunSizeRange = json['MinimunSizeRange'];
    maximunSizeRange = json['MaximunSizeRange'];
    approvedLimit = json['ApprovedLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuditCode'] = this.auditCode;
    data['CompanyName'] = this.companyName;
    data['Type'] = this.type;
    data['Location_Name'] = this.locationName;
    data['CategoryId'] = this.categoryId;
    data['CategoryName'] = this.categoryName;
    data['MinimunSizeRange'] = this.minimunSizeRange;
    data['MaximunSizeRange'] = this.maximunSizeRange;
    data['ApprovedLimit'] = this.approvedLimit;
    return data;
  }
}
