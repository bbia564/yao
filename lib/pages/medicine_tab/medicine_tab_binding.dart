import 'package:get/get.dart';

import '../medicine_first/medicine_first_logic.dart';
import '../medicine_second/medicine_second_logic.dart';
import 'medicine_tab_logic.dart';

class MedicineTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineTabLogic());
    Get.lazyPut(() => MedicineFirstLogic());
    Get.lazyPut(() => MedicineSecondLogic());
  }
}
