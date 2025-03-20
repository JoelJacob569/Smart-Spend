// import 'package:flutter/material.dart';
// import 'package:smartspend/screens/datascreens/addmembers.dart';
// // import 'package:smartspend/screens/otherscreens/badges.dart';
// // import 'package:smartspend/screens/otherscreens/profileedit.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/custom/container.dart';
// import 'package:get/get.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Customcontainer(
//               height: 200,
//               width: 400,
//               child: Padding(
//                 padding: const EdgeInsets.all(SSizes.sm),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 150,
//                       width: 150,
//                       decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     const SizedBox(width: SSizes.smd),
//                     const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Name',
//                             style: TextStyle(fontSize: SSizes.fontSizexl)),
//                         Text('UID',
//                             style: TextStyle(fontSize: SSizes.fontSizexl)),
//                       ],
//                     ),
//                     // const SizedBox(width: 63),
//                     // Column(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     IconButton(
//                     //       onPressed: () {
//                     //         Get.to(() => const Badgesedit());
//                     //       },
//                     //       icon: const Icon(Icons.military_tech_outlined),
//                     //     ),
//                     //     IconButton(
//                     //       onPressed: () {
//                     //         Get.to(() => const Profileedit());
//                     //       },
//                     //       icon: const Icon(Icons.edit),
//                     //     )
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 280,
//             left: 20,
//             right: 20,
//             child: ElevatedButton(
//               onPressed: () {
//                 Get.to(() => const Addmembers());
//               },
//               child: const Text('Add Members'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smartspend/screens/datascreens/addmembers.dart';
import 'package:smartspend/screens/otherscreens/badges.dart';
import 'package:smartspend/screens/otherscreens/profileedit.dart';
// import 'package:smartspend/screens/otherscreens/badges.dart';
// import 'package:smartspend/screens/otherscreens/profileedit.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/custom/container.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> members = [
    'Member 1',
    'Member 2',
    'Member 3',
    'Member 4',
    'Member 5',
  ];

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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 150, // Adjusted height for horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120, // Width for each item
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person, size: 50),
                          Text(members[index]),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              Get.to(() => const Addmembers());
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Badgesedit());
              },
              child: const Text('badges'),
            ),
          ),
          Positioned(
            top: 522,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Profileedit());
              },
              child: const Text('edit profile'),
            ),
          ),
        ],
      ),
    );
  }
}
