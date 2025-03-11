import 'package:flutter/material.dart';
import 'package:smartspend/screens/datascreens/addmembers.dart';
import 'package:smartspend/screens/otherscreens/badges.dart';
import 'package:smartspend/screens/otherscreens/profileedit.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/custom/container.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Customcontainer(
              height: 200,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: SSizes.smd),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name',
                            style: TextStyle(fontSize: SSizes.fontSizexl)),
                        Text('UID',
                            style: TextStyle(fontSize: SSizes.fontSizexl)),
                      ],
                    ),
                    const SizedBox(width: 63),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const Badgesedit());
                          },
                          icon: const Icon(Icons.military_tech_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const Profileedit());
                          },
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Addmembers());
              },
              child: const Text('Add Members'),
            ),
          )
        ],
      ),
    );
  }
}
