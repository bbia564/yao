import 'package:get/get.dart';

import 'com_record_logic.dart';

class ComRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
