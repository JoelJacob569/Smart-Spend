import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:smartspend/screens/otherscreens/badges.dart';
import 'package:smartspend/screens/otherscreens/chat.dart';
import 'package:smartspend/screens/otherscreens/expensegraph.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/custom/container.dart';
//import 'package:smartspend/utils/custom/progress.dart';

class HompePage2 extends StatefulWidget {
  const HompePage2({super.key});

  @override
  State<HompePage2> createState() => _HompePage2State();
}

class _HompePage2State extends State<HompePage2> {
  final goalcontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final incomecontroller = TextEditingController();
  String goal = '';
  int amount = 0;
  int income = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const Expensegraph());
                  },
                  child: Customcontainer(
                    height: size.height * 0.23,
                    width: size.width * 0.45,
                    child: const Padding(
                      padding: EdgeInsets.all(SSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily Expense',
                            style: TextStyle(fontSize: SSizes.lg),
                          ),
                          SizedBox(height: SSizes.smd),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: SSizes.iconMd,
                              ),
                              Text(
                                'Expense of the day',
                                style: TextStyle(
                                  fontSize: SSizes.md,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SSizes.smd),
                          Text(
                            'Monthly expense',
                            style: TextStyle(fontSize: SSizes.fontSizeLg),
                          ),
                          SizedBox(width: SSizes.ssm),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: SSizes.iconMd,
                              ),
                              Text('Total Expense')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: GestureDetector(
                  onTap: () {
                    openIndialog();
                  },
                  child: Customcontainer(
                    height: size.height * 0.23,
                    width: size.width * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.all(SSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Balance Income (BI)',
                            style: TextStyle(fontSize: SSizes.lg),
                          ),
                          const SizedBox(height: SSizes.ssm),
                          const Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: SSizes.iconMd,
                              ),
                              Text(
                                'BI Amount',
                                style: TextStyle(
                                  fontSize: SSizes.md,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: SSizes.ssm),
                          const Text(
                            'Monthly Income',
                            style: TextStyle(fontSize: SSizes.fontSizeLg),
                          ),
                          const SizedBox(width: SSizes.ssm),
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee,
                                size: SSizes.iconMd,
                              ),
                              Text(income.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(SSizes.sm),
            child: GestureDetector(
              onTap: () {
                openDialog();
              },
              child: Customcontainer(
                height: size.height * 0.23,
                width: size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(SSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Goals',
                        style: TextStyle(fontSize: SSizes.lg),
                      ),
                      const SizedBox(height: SSizes.ssm),
                      Text(
                        'Goal : $goal',
                        style: const TextStyle(fontSize: SSizes.lg),
                      ),
                      Text(
                        'Goal Amount : $amount',
                        style: const TextStyle(fontSize: SSizes.lg),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(SSizes.sm),
            child: Customcontainer(
              height: size.height * 0.23,
              width: size.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: Column(
                  children: [
                    Expanded(
                        child:
                            ListView(children: const [Text('Expense List')])),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(SSizes.sm),
          //   child: GestureDetector(
          //     onTap: () {
          //       Get.to(() => const Badgesedit());
          //     },
          //     child: Customcontainer(
          //       height: size.height * 0.1,
          //       width: size.width * 0.4,
          //       child: const Padding(
          //         padding: EdgeInsets.all(SSizes.sm),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('Badge', style: TextStyle(fontSize: SSizes.lg)),
          //                 Icon(Icons.military_tech),
          //               ],
          //             ),
          //             SizedBox(height: SSizes.ssm),
          //             CustomProgressIndicator(),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const ChatBot());
        },
        backgroundColor: SColors.secondary,
        child: Image.asset(SImages.chat,
            height: size.height * 0.1, width: size.width * 0.1),
      ),
    );
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(SSizes.smd),
              height: 400,
              child: Column(
                children: [
                  const Text(
                    'Set Goal',
                    style: TextStyle(fontSize: SSizes.lg),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    controller: goalcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter your goal',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    controller: amountcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter the amount',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          goal = goalcontroller.text;
                          amount = int.tryParse(amountcontroller.text) ?? 0;
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Set Goal'))
                ],
              ),
            ),
          );
        });
  }

  void openIndialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(SSizes.smd),
              height: 400,
              child: Column(
                children: [
                  const Text(
                    'Enter Monthly Income',
                    style: TextStyle(fontSize: SSizes.lg),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: incomecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Income',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          income = int.tryParse(incomecontroller.text) ?? 0;
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Set Income'))
                ],
              ),
            ),
          );
        });
  }
}
