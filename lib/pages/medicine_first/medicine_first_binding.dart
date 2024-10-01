import 'package:get/get.dart';

import 'medicine_first_logic.dart';

class MedicineFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineFirstLogic());
  }
}
