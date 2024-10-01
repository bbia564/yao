import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medicine/db_medicine/db_medicine.dart';

import '../../db_medicine/medicine_entity.dart';
import '../../db_medicine/sleep_entity.dart';

class MedicineTabLogic extends GetxController {
  PageController pageController = PageController();
  var currentIndex = 0.obs;

  DBMedicine dbMedicine = Get.find<DBMedicine>();

  var medicineList = <MedicineEntity>[];
  var sleepList = <SleepEntity>[];

  Timer? timer;

  int countNum = 0;

  getData() async {
    final medicineResult = await dbMedicine.getMedicineAllData();
    medicineList = medicineResult.where((e) => e.warning == 1).toList();
    sleepList = await dbMedicine.getSleepAllData();
    startTimer();
  }

  void startTimer() async {
    timer?.cancel();
    timer = null;
    final titles = ['Breakfast time','Lunch time', 'Dinner time','Bed time'];
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (var item in medicineList) {
        if (item.warningTime.hour == DateTime.now().hour &&
            item.warningTime.minute == DateTime.now().minute &&
            item.warningTime.second == DateTime.now().second) {
          Fluttertoast.showToast(
              msg: '${item.medicineName} is time to take medicine');
        }
        item.warningTime =
            item.warningTime.add(Duration(hours: item.intervalTime));
        dbMedicine.updateMedicine(item);
      }
      for (var item in sleepList) {
        if (item.warningTime.hour == DateTime.now().hour &&
            item.warningTime.minute == DateTime.now().minute &&
            item.warningTime.second == DateTime.now().second) {
          Fluttertoast.showToast(msg: '${titles[item.type]} is time');
        }
      }
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
