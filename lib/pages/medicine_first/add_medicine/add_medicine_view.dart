import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/main.dart';
import 'package:medicine/pages/medicine_first/add_medicine/medicine_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'add_medicine_logic.dart';

class AddMedicinePage extends GetView<AddMedicineLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New medication"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: GetBuilder<AddMedicineLogic>(builder: (_) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Drug name',
                      style: TextStyle(fontSize: 14, color: Color(0xff585858)),
                    ),
                    Container(
                      height: 40,
                      child: MedicineTextField(
                          maxLength: 15,
                          hintText: 'Enter drug name',
                          value: controller.medicineName,
                          onChange: (value) {
                            controller.medicineName = value;
                          }),
                    )
                        .decorated(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20))
                        .marginOnly(top: 10)
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Drug photograph',
                      style: TextStyle(fontSize: 14, color: Color(0xff585858)),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 87,
                        height: 87,
                        color: Colors.grey.withOpacity(0.2),
                        child: controller.imageData == null
                            ? const Icon(
                                Icons.image,
                                color: Colors.grey,
                                size: 35,
                              )
                            : Image.memory(
                                controller.imageData!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ).gestures(onTap: () {
                        controller.imageSelected();
                      }),
                    )
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Interval length',
                      style: TextStyle(fontSize: 14, color: Color(0xff585858)),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        Image.asset(
                          'assets/subtract.webp',
                          width: 20,
                          height: 20,
                        ).gestures(onTap: () {
                          controller.changeIntervalTime(isAdd: false);
                        }),
                        Obx(() {
                          return Text(
                            '${controller.intervalTime}Hours',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold),
                          );
                        }),
                        Image.asset(
                          'assets/add.webp',
                          width: 20,
                          height: 20,
                        ).gestures(onTap: () {
                          controller.changeIntervalTime();
                        }),
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ).decorated(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10))
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Whether it is empty stomach',
                      style: TextStyle(fontSize: 14, color: Color(0xff585858)),
                    ),
                    const SizedBox(height: 10),
                    <Widget>[
                      Expanded(
                        child: Obx(() {
                          return Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text('Empty stomach',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: controller.emptyStomach.value == 0
                                        ? Colors.black
                                        : Colors.grey)),
                          )
                              .decorated(
                                  border: controller.emptyStomach.value == 0
                                      ? Border.all(
                                          color: const Color(0xff4aa48d))
                                      : null,
                                  color: controller.emptyStomach.value == 0
                                      ? const Color(0xffeef7f7)
                                      : Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12))
                              .gestures(onTap: () {
                            controller.emptyStomach.value = 0;
                          });
                        }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Obx(() {
                          return Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text('No fasting',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: controller.emptyStomach.value == 1
                                        ? Colors.black
                                        : Colors.grey)),
                          )
                              .decorated(
                                  border: controller.emptyStomach.value == 1
                                      ? Border.all(
                                          color: const Color(0xff4aa48d))
                                      : null,
                                  color: controller.emptyStomach.value == 1
                                      ? const Color(0xffeef7f7)
                                      : Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12))
                              .gestures(onTap: () {
                            controller.emptyStomach.value = 1;
                          });
                        }),
                      )
                    ].toRow()
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Whether to remind',
                      style: TextStyle(fontSize: 14, color: Color(0xff585858)),
                    ),
                    Obx(() {
                      return Switch(
                          value: controller.warning.value == 0 ? false : true,
                          activeTrackColor: Colors.green,
                          onChanged: (value) {
                            controller.warning.value = value ? 1 : 0;
                          });
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Commit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ).decorated(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)).marginOnly(top: 10).gestures(onTap: () {
                      controller.commit(context);
                })
              ].toColumn(),
            );
          }).marginAll(15),
        ),
      ),
    );
  }
}
