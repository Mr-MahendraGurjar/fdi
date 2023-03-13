import 'dart:async';
import 'dart:convert';
import 'package:FdisTesting/models/audit_model.dart';
import 'package:FdisTesting/utils/api.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuditProvider with ChangeNotifier {
  final api = Api();
  AuditListModel auditModel = AuditListModel();

  Future<List<AuditList>> fetchAuditList(String clientId) async {
    List<AuditList> list = [];
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var header = {
      "x-access-token": token,
      "Authorization": "Bearer $token",
    };
    final response = await api.get(
        'api/v1/dashboard/audit?ucId=$clientId');
    final item = response.data;
    if (response.statusCode == 200) {
      auditModel = AuditListModel.fromJson(item);
      list.addAll(auditModel.data?.rows ?? []);
    }
    notifyListeners();
    return list;
  }
}
