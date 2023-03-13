class ClientModel {
  bool? success;
  int? serverCode;
  String? message;
  List<Data>? data;

  ClientModel({this.success, this.serverCode, this.message, this.data});

  ClientModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? companyName;
  var contactPerson;
  var phone;
  var mobile;
  var fax;
  var streetName;
  var zipCode;
  var city;
  var state;
  var countryId;
  var id;
  var branchId;
  var uRLClientPortal;
  int? reportType;

  Data(
      {this.companyName,
        this.contactPerson,
        this.phone,
        this.mobile,
        this.fax,
        this.streetName,
        this.zipCode,
        this.city,
        this.state,
        this.countryId,
        this.id,
        this.branchId,
        this.uRLClientPortal,
        this.reportType});

  Data.fromJson(Map<String, dynamic> json) {
    companyName = json['CompanyName'];
    contactPerson = json['ContactPerson'];
    phone = json['Phone'];
    mobile = json['Mobile'];
    fax = json['Fax'];
    streetName = json['StreetName'];
    zipCode = json['ZipCode'];
    city = json['City'];
    state = json['State'];
    countryId = json['CountryId'];
    id = json['Id'];
    branchId = json['Branch_Id'];
    uRLClientPortal = json['URLClientPortal'];
    reportType = json['ReportType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyName'] = this.companyName;
    data['ContactPerson'] = this.contactPerson;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['Fax'] = this.fax;
    data['StreetName'] = this.streetName;
    data['ZipCode'] = this.zipCode;
    data['City'] = this.city;
    data['State'] = this.state;
    data['CountryId'] = this.countryId;
    data['Id'] = this.id;
    data['Branch_Id'] = this.branchId;
    data['URLClientPortal'] = this.uRLClientPortal;
    data['ReportType'] = this.reportType;
    return data;
  }
}
