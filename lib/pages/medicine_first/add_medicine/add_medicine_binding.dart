import 'package:get/get.dart';

import 'add_medicine_logic.dart';

class AddMedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMedicineLogic());
  }
}
