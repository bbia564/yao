import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'medicine_first_logic.dart';

class MedicineFirstPage extends GetView<MedicineFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: 4,
          itemBuilder: (_, index) {
            return GestureDetector(
              child: Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/item$index.webp',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    <Widget>[
                      <Widget>[
                        Expanded(
                          child: Text(
                            itemTitles[index],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                          color: Colors.grey,
                        )
                      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Text(
                        itemSubTitles[index],
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).marginOnly(top: 15,left: 12,right: 12)
                  ],
                ),
              ),onTap: () {
                switch (index) {
                  case 0:
                    Get.toNamed('/addMedicine');
                  break;
                  case 1:
                    Get.toNamed('/medicineManager');
                    break;
                  case 2:
                    Get.toNamed('/conditionRecord');
                    break;
                  case 3:
                    Get.toNamed('/sleepSettings');
                    break;
                }
            },
            );
          }).marginAll(15),
    );
  }
}
