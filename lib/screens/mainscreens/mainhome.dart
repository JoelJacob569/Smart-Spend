import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartspend/screens/mainscreens/Addbill.dart';
import 'package:smartspend/screens/mainscreens/emicalc.dart';
import 'package:smartspend/screens/mainscreens/expense.dart';
import 'package:smartspend/screens/mainscreens/homedrawer.dart';
import 'package:smartspend/screens/mainscreens/profile.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Mainhome extends StatelessWidget {
  const Mainhome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationConroller());
    final darkmode = SHelperFunctions.isDarkMode(context);
    final List<Widget> navigationitems = [
      const NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
      const NavigationDestination(
          icon: Icon(Icons.currency_rupee), label: 'Expenses'),
      const NavigationDestination(
          icon: Icon(Iconsax.add), label: 'Add Expense'),
      const NavigationDestination(
          icon: Icon(Iconsax.calculator), label: 'EMICalc'),
      const NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index) =>
              controller.selectedindex.value = index,
          backgroundColor: darkmode ? SColors.black : SColors.white,
          indicatorColor: darkmode
              ? SColors.white.withValues(alpha: 0.1)
              : SColors.black.withValues(alpha: 0.1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: navigationitems,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedindex.value]),
    );
  }
}

class NavigationConroller extends GetxController {
  final Rx<int> selectedindex = 0.obs;
  final screens = [
    const MyHomePage(),
    const MainExpense(),
    const Addbill(),
    const EMICalculator(),
    const ProfilePage(),
  ];
}
