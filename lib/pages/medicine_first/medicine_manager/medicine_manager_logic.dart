import 'package:get/get.dart';
import 'package:medicine/db_medicine/medicine_entity.dart';

import '../../../db_medicine/db_medicine.dart';
import '../../medicine_tab/medicine_tab_logic.dart';

class MedicineManagerLogic extends GetxController {

  DBMedicine dbMedicine = Get.find<DBMedicine>();

  var list = <MedicineEntity>[].obs;

  bool isEdit = false;

  void getData() async {
    list.value = await dbMedicine.getMedicineAllData();
  }

  void delete(MedicineEntity entity) async {
    await dbMedicine.deleteMedicine(entity);
    getData();
    MedicineTabLogic logic = Get.find<MedicineTabLogic>();
    logic.getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
