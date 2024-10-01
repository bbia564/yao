import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'medicine_second_logic.dart';

class MedicineSecondPage extends GetView<MedicineSecondLogic> {
  Widget _meItem(int index, BuildContext context) {
    final titles = ['Clean all data', 'About US'];
    return GestureDetector(
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: <Widget>[
          Text(titles[index]),
          index == 1 ? Text('1.0.0').paddingOnly(right: 12) : const Icon(
            Icons.keyboard_arrow_right,
            size: 20,
            color: Colors.grey,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
      ),
      onTap: () {
        switch (index) {
          case 0:
            controller.cleanMedicineData();
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding:const EdgeInsets.all(12),
            child: <Widget>[
              _meItem(0, context),
              _meItem(1, context)
            ].toColumn(
                separator: Divider(
              height: 14,
              color: Colors.grey.withOpacity(0.3),
            )),
          ).decorated(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        ).marginAll(15),
      ),
    );
  }
}
