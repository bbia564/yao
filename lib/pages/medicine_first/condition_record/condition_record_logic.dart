import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/db_medicine/condition_record_entity.dart';
import 'package:medicine/db_medicine/db_medicine.dart';
import 'package:medicine/pages/medicine_first/add_medicine/medicine_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

class ConditionRecordLogic extends GetxController {

  DBMedicine dbMedicine = Get.find<DBMedicine>();

  var list = <ConditionRecordEntity>[].obs;

  void getData() async {
    list.value = await dbMedicine.getConditionRecordAllData();
  }

  void add() async {
    var text = '';
    Get.dialog(AlertDialog(
      title: const Text(
        'Seizure symptom',
        textAlign: TextAlign.center,
      ),
      actions: [
        Container(
          width: double.infinity,
          height: 40,
          child: MedicineTextField(
              value: text,
              textAlign: TextAlign.center,
              maxLength: 20,
              onChange: (value) {
                text = value;
              }),
        )
            .decorated(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey))
            .marginAll(12),
        <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text('Cancel',style: TextStyle(color: Colors.black),),
          ),
          TextButton(
            onPressed: () async {
              await dbMedicine.dbBase.insert('conditionRecord', {
                'createTime':DateTime.now().toIso8601String(),
                'title': text
              });
              getData();
              Get.back();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
      ],
    ),barrierDismissible: false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
