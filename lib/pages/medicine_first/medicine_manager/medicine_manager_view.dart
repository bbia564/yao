import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'medicine_manager_logic.dart';

class MedicineManagerPage extends GetView<MedicineManagerLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineManagerLogic>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Medication management'),
            actions: [
              Text(
                controller.isEdit ? 'Cancel' : 'Edit',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ).marginOnly(right: 20).gestures(onTap: () {
                controller.isEdit = !controller.isEdit;
                controller.update();
              })
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(12),
            child: Obx(() {
              return controller.list.isEmpty
                  ? const Center(
                child: Text('No data'),
              )
                  : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return Container(
                      child: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(
                            entity.imageData,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: <Widget>[
                              <Widget>[
                                Expanded(
                                    child: <Widget>[
                                      <Widget>[
                                        Flexible(
                                            child: Text(
                                              entity.medicineName,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Visibility(
                                          visible: controller.isEdit,
                                          child: const Icon(
                                            Icons.delete_forever,
                                            size: 20,
                                            color: Colors.orange,
                                          )
                                              .marginOnly(left: 10)
                                              .gestures(onTap: () {
                                                controller.delete(entity);
                                          }),
                                        )
                                      ].toRow(),
                                      Text(
                                        '${entity.intervalTime}Hours / ${entity
                                            .emptyStomach == 0
                                            ? 'Empty stomach'
                                            : 'No fasting'}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    ].toColumn(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start)),
                                <Widget>[
                                  Text(
                                    entity.warningTimeString,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Dosing countdown',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )
                                ].toColumn(
                                    crossAxisAlignment: CrossAxisAlignment.end)
                              ].toRow().marginSymmetric(vertical: 3),
                              Divider(
                                height: 1,
                                color: Colors.grey.withOpacity(0.3),
                              )
                            ].toColumn())
                      ].toRow(crossAxisAlignment: CrossAxisAlignment.start),
                    );
                  });
            }),
          )
              .decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(12))
              .marginAll(12));
    });
  }
}
