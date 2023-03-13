import 'package:FdisTesting/models/client_model.dart';
import 'package:FdisTesting/utils/api.dart';
import 'package:flutter/widgets.dart';

class ClientProvider with ChangeNotifier {
  final api = Api();
  ClientModel? clientModel;

  fetchClientList() async {
    final response = await api.get(
        'api/v1/dashboard/mob/clientlist/39FBE70B-CED6-4539-83E7-74A38F9CBE51');
    final item = response.data;
    if (response.statusCode == 200) {
      clientModel = ClientModel.fromJson(item);
    }
    notifyListeners();
  }

  void changeState() {
    clientModel = null;
    notifyListeners();
  }
}
