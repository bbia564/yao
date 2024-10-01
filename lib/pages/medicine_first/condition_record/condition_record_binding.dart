import 'package:get/get.dart';

import 'condition_record_logic.dart';

class ConditionRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConditionRecordLogic());
  }
}
