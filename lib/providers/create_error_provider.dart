import 'dart:async';
import 'dart:io';
import 'package:FdisTesting/models/element_by_id_model.dart';
import 'package:FdisTesting/models/error_type_model.dart';
import 'package:FdisTesting/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateErrorProvider with ChangeNotifier {
  final api = Api();
  ElementByIdModel elementByIdModel = ElementByIdModel();
  ErrorTypeModel errorTypeModel = ErrorTypeModel();
  ElementData? selectedElementValue;
  ErrorData? selectedErrorValue;
  File? logBoekImage;
  File? technischeImage;
  late PermissionStatus _permissionStatus;

  int _counts = 0;

  int get count => _counts;

  Future<void> cameraPermission() async {
    final status = await Permission.camera.request();
    _permissionStatus = status;
    notifyListeners();
  }

  Future<void> logBoekCaptureImage(BuildContext context) async {
    if (logBoekImage == null) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        logBoekImage = File(image.path);
      }
      notifyListeners();
    }
  }

  Future<void> technischeCaptureImage(BuildContext context) async {
    if (technischeImage == null) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        technischeImage = File(image.path);
      }
      notifyListeners();
    }
    return Future.value();
  }

  void increment() {
    _counts++;
    notifyListeners();
  }

  void decrement() {
    if (_counts > 0) {
      _counts--;
      notifyListeners();
    }
  }

  Future<List<ElementData>> getElementById(String categoryId) async {
    final response =
        await api.get('api/v1/dashboard/Mob/ElementType/$categoryId');
    final item = response.data;
    List<ElementData> list = [];
    if (response.statusCode == 200) {
      elementByIdModel = ElementByIdModel.fromJson(item);
      list.addAll(elementByIdModel.data ?? []);
    }
    notifyListeners();
    return list;
  }

  Future<List<ErrorData>> getErrorsList() async {
    final response = await api.get('api/v1/dashboard/Mob/ErrorType');
    final item = response.data;
    List<ErrorData> list = [];
    if (response.statusCode == 200) {
      errorTypeModel = ErrorTypeModel.fromJson(item);
      list.addAll(errorTypeModel.data ?? []);
    }
    notifyListeners();
    return list;
  }

  void clearTechnischeImage() {
    technischeImage = null;
    notifyListeners();
  }

  void clearLogBoekImage() {
    logBoekImage = null;
    notifyListeners();
  }
}
