import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:medicine/db_medicine/db_medicine.dart';
import 'package:medicine/pages/medicine_tab/medicine_tab_logic.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MedicineSecondLogic extends GetxController {

  DBMedicine dbMedicine = Get.find<DBMedicine>();

  cleanMedicineData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbMedicine.cleanMedicineData();
            await dbMedicine.cleanConditionRecordData();
            await dbMedicine.cleanSleepData();
            MedicineTabLogic medicineTabLogic = Get.find<MedicineTabLogic>();
            medicineTabLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutMedicinePrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(data: """
#### Data Collection
Our apps do not collect any personal information or user data. All event logs are executed locally on the device and are not transmitted to any external server.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """),
        );
      },
    );
  }

  aboutMedicineUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/logo.png',
        width: 75,
        height: 75,
      ),
      children: [
        const Text(
            """We can provide you with new medication, medication management, medical records, and rest Settings."""),
      ],
      context: context,
    );
  }

}
