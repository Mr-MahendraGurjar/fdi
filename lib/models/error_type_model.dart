class ErrorTypeModel {
  bool? success;
  int? serverCode;
  String? message;
  List<ErrorData>? data;

  ErrorTypeModel({this.success, this.serverCode, this.message, this.data});

  ErrorTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ErrorData>[];
      json['data'].forEach((v) {
        data!.add(ErrorData.fromJson(v));
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

class ErrorData {
  String? errorTypeId;
  String? errorTypeValue;
  int? sortOrder;
  int? errorCategoryId;
  int? errorKindId;

  ErrorData(
      {this.errorTypeId,
      this.errorTypeValue,
      this.sortOrder,
      this.errorCategoryId,
      this.errorKindId});

  ErrorData.fromJson(Map<String, dynamic> json) {
    errorTypeId = json['ErrorTypeId'];
    errorTypeValue = json['ErrorTypeValue'];
    sortOrder = json['SortOrder'];
    errorCategoryId = json['ErrorCategoryId'];
    errorKindId = json['ErrorKindId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ErrorTypeId'] = errorTypeId;
    data['ErrorTypeValue'] = errorTypeValue;
    data['SortOrder'] = sortOrder;
    data['ErrorCategoryId'] = errorCategoryId;
    data['ErrorKindId'] = errorKindId;
    return data;
  }
}
