import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medicine/db_medicine/db_medicine.dart';
import 'package:medicine/pages/medicine_tab/medicine_tab_logic.dart';

class SleepSettingsLogic extends GetxController {
  DBMedicine dbMedicine = Get.find<DBMedicine>();

  DateTime? time1;
  String time1String = '';
  DateTime? time2;
  String time2String = '';
  DateTime? time3;
  String time3String = '';
  DateTime? time4;
  String time4String = '';

  var isWarning = 1.obs;

  void timeSelect(int index, BuildContext context) {
    DatePicker.showDatePicker(context,
        pickerMode: DateTimePickerMode.date,
        dateFormat: 'HH:mm', onConfirm: (date, dateList) {
      final resultDate = DateTime.parse(DateFormat('yyyy-MM-dd HH:mm').format(date).substring(0,16));
      switch (index) {
        case 0:
          time1 = resultDate;
          time1String = DateFormat('HH:mm').format(date);
          break;
        case 1:
          time2 = resultDate;
          time2String = DateFormat('HH:mm').format(date);
          break;
        case 2:
          time3 = resultDate;
          time3String = DateFormat('HH:mm').format(date);
          break;
        case 3:
          time4 = resultDate;
          time4String = DateFormat('HH:mm').format(date);
          break;
      }
      update();
    });
  }

  void commit(BuildContext context) async {
    if (time1 == null && time2 == null && time3 == null && time4 == null) {
      Fluttertoast.showToast(msg: 'Please select one time');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final now = DateTime.now();
    if (isWarning.value == 1) {
      if (time1 != null) {
        await dbMedicine.dbBase.insert('sleep', {
          'createTime': now.toIso8601String(),
          'type': 0,
          'warningTime': time1!.toIso8601String()
        });
      }
      if (time2 != null) {
        await dbMedicine.dbBase.insert('sleep', {
          'createTime': now.toIso8601String(),
          'type': 1,
          'warningTime': time2!.toIso8601String()
        });
      }
      if (time3 != null) {
        await dbMedicine.dbBase.insert('sleep', {
          'createTime': now.toIso8601String(),
          'type': 2,
          'warningTime': time3!.toIso8601String()
        });
      }
      if (time4 != null) {
        await dbMedicine.dbBase.insert('sleep', {
          'createTime': now.toIso8601String(),
          'type': 3,
          'warningTime': time4!.toIso8601String()
        });
      }
    }
    MedicineTabLogic logic = Get.find<MedicineTabLogic>();
    logic.getData();
    Fluttertoast.showToast(msg: 'Add success');
    Get.back();
  }
}
