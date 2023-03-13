import 'package:FdisTesting/models/profile_model.dart';
import 'package:FdisTesting/models/setting_model.dart';
import 'package:FdisTesting/utils/api.dart';
import 'package:FdisTesting/utils/shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  final api = Api();
  SettingModel settingModel = SettingModel();
  UserProfileModel userProfileModel = UserProfileModel();
  String userName = "";


  fetchSettingData() async {
    userName = await SharedPrefs.getUserName();
    final response = await api.get(
        'api/v1/dashboard/Mob/setting/BB709DD6-B2A0-43CB-9796-FAC24E7965EF');
    final item = response.data;
    if (response.statusCode == 200) {
      settingModel = SettingModel.fromJson(item);
    }
    notifyListeners();
  }

  void getProfileData() async {
    String userId = await SharedPrefs.getUserId();
    final response = await api.get(
        'api/v1/dashboard/mob/userprofile/$userId');
    final item = response.data;
    if (response.statusCode == 200) {
      userProfileModel = UserProfileModel.fromJson(item);
    }
    notifyListeners();
  }
}
