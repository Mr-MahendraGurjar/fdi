class UserProfileModel {
  bool? success;
  int? serverCode;
  String? message;
  List<ProfileData>? data;

  UserProfileModel({this.success, this.serverCode, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProfileData>[];
      json['data'].forEach((v) {
        data!.add(ProfileData.fromJson(v));
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

class ProfileData {
  String? id;
  String? userName;
  var profileImage;

  ProfileData({this.id, this.userName, this.profileImage});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userName = json['UserName'];
    profileImage = json['ProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserName'] = userName;
    data['ProfileImage'] = profileImage;
    return data;
  }
}
