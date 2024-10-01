import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'condition_record_logic.dart';

class ConditionRecordPage extends GetView<ConditionRecordLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Condition Record'),
      ),
      body: SafeArea(
        child: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Record onset time',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(25))
              .gestures(onTap: () {
            controller.add();
          }),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(12),
            child: Obx(() {
              return controller.list.value.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : ListView.builder(
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final conditionRecordEntity =
                            controller.list.value[index];
                        return <Widget>[
                          Text(
                            conditionRecordEntity.title,
                            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            conditionRecordEntity.createTimeString,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          Divider(
                            height: 15,
                            color: Colors.grey.withOpacity(0.3),
                          ).marginOnly(top: 10)
                        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
                      });
            }),
          ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)))
        ].toColumn().marginAll(12),
      ),
    );
  }
}
