import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/db_medicine/db_medicine.dart';
import 'package:medicine/pages/com_record/com_record_binding.dart';
import 'package:medicine/pages/com_record/com_record_view.dart';
import 'package:medicine/pages/medicine_first/add_medicine/add_medicine_binding.dart';
import 'package:medicine/pages/medicine_first/add_medicine/add_medicine_view.dart';
import 'package:medicine/pages/medicine_first/ans.dart';
import 'package:medicine/pages/medicine_first/condition_record/condition_record_binding.dart';
import 'package:medicine/pages/medicine_first/condition_record/condition_record_view.dart';
import 'package:medicine/pages/medicine_first/medicine_first_binding.dart';
import 'package:medicine/pages/medicine_first/medicine_first_view.dart';
import 'package:medicine/pages/medicine_first/medicine_manager/medicine_manager_binding.dart';
import 'package:medicine/pages/medicine_first/medicine_manager/medicine_manager_view.dart';
import 'package:medicine/pages/medicine_first/sleep_settings/sleep_settings_binding.dart';
import 'package:medicine/pages/medicine_first/sleep_settings/sleep_settings_view.dart';
import 'package:medicine/pages/medicine_second/medicine_second_binding.dart';
import 'package:medicine/pages/medicine_second/medicine_second_view.dart';
import 'package:medicine/pages/medicine_tab/medicine_tab_binding.dart';
import 'package:medicine/pages/medicine_tab/medicine_tab_view.dart';

Color primaryColor = const Color(0xff4aa48d);
Color bgColor = const Color(0xfff2f9fc);

List<String> itemTitles = [
  'New medication',
  'Medication management',
  'Condition record',
  'Schedule setting'
];
List<String> itemSubTitles = [
  'Create and increase your medication ',
  'Manage your medication ',
  'Record your morbidity ',
  'Set your sleep schedule'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBMedicine().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Lists,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Lists = [
  GetPage(name: '/', page: () => const ComRecordView(), binding: ComRecordBinding()),
  GetPage(name: '/medicineTab', page: () => MedicineTabPage(), binding: MedicineTabBinding()),
  GetPage(name: '/medicineFirst', page: () => MedicineFirstPage(),binding: MedicineFirstBinding()),
  GetPage(name: '/medicineAns', page: () => const AnsPageV()),
  GetPage(name: '/medicineSecond', page: () => MedicineSecondPage(),binding: MedicineSecondBinding()),
  GetPage(name: '/addMedicine', page: () => AddMedicinePage(),binding: AddMedicineBinding()),
  GetPage(name: '/medicineManager', page: () => MedicineManagerPage(),binding: MedicineManagerBinding()),
  GetPage(name: '/conditionRecord', page: () => ConditionRecordPage(),binding: ConditionRecordBinding()),
  GetPage(name: '/sleepSettings', page: () => SleepSettingsPage(),binding: SleepSettingsBinding()),
];
