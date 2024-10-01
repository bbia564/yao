import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/pages/medicine_first/medicine_first_view.dart';
import 'package:medicine/pages/medicine_second/medicine_second_view.dart';

import '../../main.dart';
import 'medicine_tab_logic.dart';

class MedicineTabPage extends GetView<MedicineTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          MedicineFirstPage(),
          MedicineSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navMeBars()),
    );
  }

  Widget _navMeBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
