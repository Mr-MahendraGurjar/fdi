import 'package:FdisTesting/models/store_data_model.dart';
import 'package:flutter/widgets.dart';

class ListOfErrorProvider with ChangeNotifier {
  List<EntryData> list = [];

  void addData(List<EntryData> value) {
    list.addAll(value);
    notifyListeners();
  }

  void removeItem(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
