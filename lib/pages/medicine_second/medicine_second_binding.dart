import 'package:get/get.dart';

import 'medicine_second_logic.dart';

class MedicineSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineSecondLogic());
  }
}
