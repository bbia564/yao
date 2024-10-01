import 'package:get/get.dart';

import 'medicine_manager_logic.dart';

class MedicineManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineManagerLogic());
  }
}
