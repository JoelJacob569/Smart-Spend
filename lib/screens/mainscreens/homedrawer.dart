import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartspend/screens/loginscreens/welcome.dart';
import 'package:smartspend/screens/mainscreens/home.dart';
import 'package:smartspend/screens/otherscreens/about.dart';
import 'package:smartspend/screens/otherscreens/history.dart';
import 'package:smartspend/screens/otherscreens/notification.dart';
import 'package:smartspend/screens/otherscreens/setting.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';
import 'package:smartspend/screens/otherscreens/profileedit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    Future<void> logout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

      Get.offAll(() => const Welcompage());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Smart Spend')),
        leading: Builder(
          builder: (context) => IconButton(
              icon: const Icon(Iconsax.menu_1),
              color: dark ? Colors.white : Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification),
            color: dark ? Colors.white : Colors.black,
            onPressed: () {
              Get.to(() => const NotificationPage());
            },
          ),
        ],
      ),
      body: const HompePage2(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: size.height * 0.22,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: dark ? Colors.blue : Colors.blueAccent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Container(
                          height: size.height * 0.1,
                          width: size.height * 0.1,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('User Name'),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() => const Profileedit());
                            },
                          )
                        ],
                      )
                    ],
                  )),
            ),
            ListTile(
              leading: const Icon(Iconsax.setting),
              title: const Text('Settings'),
              onTap: () {
                Get.to(() => const Settings());
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Get.to(() => const HistoryPage());
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.logout),
              title: const Text('Logout'),
              onTap: () {
                logout();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Iconsax.star),
              title: const Text('Rate Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Iconsax.info_circle),
              title: const Text('About'),
              onTap: () {
                Get.to(() => const AboutPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
