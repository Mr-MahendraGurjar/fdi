class FeedbackModel {
  bool? success;
  int? serverCode;
  String? message;

  FeedbackModel({this.success, this.serverCode, this.message});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    return data;
  }
}
