import 'package:get/get.dart';

import 'sleep_settings_logic.dart';

class SleepSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SleepSettingsLogic());
  }
}
