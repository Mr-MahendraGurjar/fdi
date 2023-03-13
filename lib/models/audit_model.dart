class AuditListModel {
  bool? success;
  int? serverCode;
  String? message;
  Data? data;

  AuditListModel({this.success, this.serverCode, this.message, this.data});

  AuditListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<AuditList>? rows;

  Data({this.count, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = <AuditList>[];
      json['rows'].forEach((v) {
        rows!.add(new AuditList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AuditList {
  String? auditCode;
  String? date;
  bool? isActive;
  bool? isDone;
  String? id;
  String? type;
  String? nameClientId;
  String? locationClientId;
  String? presentClient;

  String? lastControlDate;
  bool? activate;

  UserClient? userClient;
  Location? location;

  AuditList(
      {this.auditCode,
        this.date,
        this.isActive,
        this.isDone,
        this.id,
        this.type,
        this.nameClientId,
        this.locationClientId,
        this.presentClient,
        this.lastControlDate,
        this.activate,
        this.userClient,
        this.location});

  AuditList.fromJson(Map<String, dynamic> json) {
    auditCode = json['AuditCode'];
    date = json['Date'];
    isActive = json['IsActive'];
    isDone = json['IsDone'];
    id = json['Id'];
    type = json['Type'];
    nameClientId = json['NameClient_Id'];
    locationClientId = json['LocationClient_Id'];
    presentClient = json['PresentClient'];
    lastControlDate = json['LastControlDate'];
    activate = json['Activate'];
    userClient = json['UserClient'] != null
        ? new UserClient.fromJson(json['UserClient'])
        : null;
    location = json['Location'] != null
        ? new Location.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuditCode'] = this.auditCode;
    data['Date'] = this.date;
    data['IsActive'] = this.isActive;
    data['IsDone'] = this.isDone;
    data['Id'] = this.id;
    data['Type'] = this.type;
    data['NameClient_Id'] = this.nameClientId;
    data['LocationClient_Id'] = this.locationClientId;
    data['PresentClient'] = this.presentClient;
    data['LastControlDate'] = this.lastControlDate;
    data['Activate'] = this.activate;
    if (this.userClient != null) {
      data['UserClient'] = this.userClient!.toJson();
    }
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    return data;
  }
}

class UserClient {
  String? id;
  String? companyName;


  UserClient(
      {this.id,
        this.companyName,});

  UserClient.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    companyName = json['CompanyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CompanyName'] = this.companyName;
    return data;
  }
}

class Location {
  String? id;
  String? name;
  int? size;
  String? clientId;
  String? region;
  String? city;
  String? address;
  String? contactPerson;
  bool? activate;

  Location(
      {this.id,
        this.name,
        this.size,
        this.clientId,
        this.region,
        this.city,
        this.address,
        this.contactPerson,
        this.activate});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    size = json['Size'];
    clientId = json['ClientId'];
    region = json['Region'];
    city = json['City'];
    address = json['Address'];
    contactPerson = json['ContactPerson'];
    activate = json['Activate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Size'] = this.size;
    data['ClientId'] = this.clientId;
    data['Region'] = this.region;
    data['City'] = this.city;
    data['Address'] = this.address;
    data['ContactPerson'] = this.contactPerson;
    data['Activate'] = this.activate;
    return data;
  }
}
