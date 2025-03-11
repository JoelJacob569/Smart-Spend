import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/sizes.dart';

import 'package:smartspend/utils/custom/container.dart';
import 'package:smartspend/utils/custom/smallcontainer.dart';

class MainExpense extends StatefulWidget {
  const MainExpense({super.key});

  @override
  State<MainExpense> createState() => _MainExpenseState();
}

class _MainExpenseState extends State<MainExpense> {
  final expensecontroller = TextEditingController();
  bool isTenureInYears = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                openLoandialog();
              },
              child: const Customcontainer(
                height: 150,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.all(SSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan Tracker',
                        style: TextStyle(
                          fontSize: SSizes.lg,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Loan Amount:'),
                      Text('Interest rate:'),
                      Text('Tensure:'),
                      Text('Balance Loan amount:'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            child: Customcontainer(
              height: 230,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: Wrap(
                  children: [
                    const Text(
                      'Bills and Recharges',
                      style: TextStyle(
                        fontSize: SSizes.md,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 180, height: 40),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.propane_tank,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Gas Cylinder')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.emoji_objects_outlined,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Electricity')
                      ],
                    ),
                    const SizedBox(width: 23),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.water_drop,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Water')
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.charging_station,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('     Mobile \n   Recharge')
                      ],
                    ),
                    const SizedBox(height: 100),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.signal_wifi_4_bar,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('      WIFI \n Recharge')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.tv,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('   DTH/\nCableTV')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.school,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Education Fees')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.more_horiz,
                          press: () {
                            openOtherdialog();
                          },
                        ),
                        const Text('Others')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 470,
            left: 20,
            right: 20,
            child: Customcontainer(
              height: 230,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.sm),
                child: Wrap(
                  children: [
                    const Text(
                      'Loans and EMIs',
                      style: TextStyle(
                        fontSize: SSizes.md,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 180, height: 40),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.home,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Home Loan')
                      ],
                    ),
                    const SizedBox(width: 35),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.directions_car,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Vehicle Loan')
                      ],
                    ),
                    const SizedBox(width: 23),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.school,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Educational Loan')
                      ],
                    ),
                    const SizedBox(height: 100),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.person,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Personal Loan')
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.paid_outlined,
                          press: () {
                            openExdialog();
                          },
                        ),
                        const Text('Gold Loan')
                      ],
                    ),
                    const SizedBox(width: 70),
                    Column(
                      children: [
                        SmallIcon(
                          h: 40,
                          w: 40,
                          iconSrc: Icons.more_horiz,
                          press: () {
                            openOtherdialog();
                          },
                        ),
                        const Text('Others')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openExdialog() {
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
                    'Enter Your Expense',
                    style: TextStyle(fontSize: SSizes.lg),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expensecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Amount',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Epense'))
                ],
              ),
            ),
          );
        });
  }

  void openOtherdialog() {
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
                    'Other Expenses',
                    style: TextStyle(fontSize: SSizes.lg),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expensecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Expense Type',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expensecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Expense Amount',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Epense'))
                ],
              ),
            ),
          );
        });
  }

  void openLoandialog() {
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
                    'Loan Tracker',
                    style: TextStyle(fontSize: SSizes.lg),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expensecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Loan Amount',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expensecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Interest rate',
                    ),
                  ),
                  const SizedBox(height: SSizes.ssm),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Tenure',
                            hintText: 'Enter loan tenure',
                          ),
                        ),
                      ),
                      Switch(
                        value: isTenureInYears,
                        onChanged: (value) {
                          setState(() {
                            isTenureInYears = value;
                          });
                        },
                      ),
                      Text(isTenureInYears ? 'Years' : 'Months'),
                    ],
                  ),
                  const SizedBox(height: SSizes.sm),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Track Loan'))
                ],
              ),
            ),
          );
        });
  }
}
