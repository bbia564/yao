

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine/db_medicine/db_medicine.dart';

import '../../medicine_tab/medicine_tab_logic.dart';

class AddMedicineLogic extends GetxController {

  DBMedicine dbMedicine = Get.find<DBMedicine>();

  String medicineName = '';

  Uint8List? imageData;
  var intervalTime = 1.obs;
  var emptyStomach = 0.obs;
  var warning = 1.obs;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        imageData = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please try again with another picture');
      return;
    }
  }

  void changeIntervalTime({bool isAdd = true}) {
    if (isAdd) {
      if (intervalTime.value < 12) {
        intervalTime.value++;
      }
    } else {
      if (intervalTime.value > 1) {
        intervalTime.value--;
      }
    }
  }

  void commit(BuildContext context) async {
    if (medicineName.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter medicine name');
      return;
    }
    if (imageData == null) {
      Fluttertoast.showToast(msg: 'Please select a picture');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final now = DateTime.now();
    final currentWarningTime = now.add(Duration(hours: intervalTime.value));
    await dbMedicine.dbBase.insert('medicine', {
      'createTime':now.toIso8601String(),
      'medicineName': medicineName,
      'imageData': imageData,
      'intervalTime': intervalTime.value,
      'emptyStomach': emptyStomach.value,
      'warning': warning.value,
      'warningTime': currentWarningTime.toIso8601String(),
    });
    MedicineTabLogic logic = Get.find<MedicineTabLogic>();
    logic.getData();
    Fluttertoast.showToast(msg: 'Add success');
    Get.back();
  }

}
