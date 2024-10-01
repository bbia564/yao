import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/pages/medicine_first/add_medicine/medicine_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'sleep_settings_logic.dart';

class SleepSettingsPage extends GetView<SleepSettingsLogic> {
  Widget _item(int index, String timeString, BuildContext context) {
    final titles = ['Breakfast time','Lunch time', 'Dinner time','Bed time'];
    return Container(
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontSize: 14, color: Color(0xff585858)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.all(12),
          child: IgnorePointer(
            ignoring: true,
            child: MedicineTextField(
                hintText: 'Selection time',
                textAlign: TextAlign.center,
                value: timeString,
                onChange: (value) {
                  timeString = value;
                }),
          ),
        )
            .decorated(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10))
            .gestures(onTap: () {
          controller.timeSelect(index, context);
        })
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule setting'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<SleepSettingsLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  _item(0, controller.time1String, context),
                  _item(1, controller.time2String, context),
                  _item(2, controller.time3String, context),
                  _item(3, controller.time4String, context),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const Text(
                        'Whether to remind',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xff585858)),
                      ),
                      Obx(() {
                        return Switch(
                            value: controller.isWarning.value == 0 ? false : true,
                            activeTrackColor: Colors.green,
                            onChanged: (value) {
                              controller.isWarning.value = value ? 1 : 0;
                            });
                      })
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
            }).marginAll(15)),
      ),
    );
  }
}
