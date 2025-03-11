import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/custom/container.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Expensegraph extends StatefulWidget {
  const Expensegraph({super.key});

  @override
  State<Expensegraph> createState() => _ExpensegraphState();
}

class _ExpensegraphState extends State<Expensegraph> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: Column(
        children: [
          const Customcontainer(
            height: 300,
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(SSizes.sm),
              child: Text('Daily expense graph'),
            ),
          ),
          const SizedBox(height: SSizes.smd),
          Customcontainer(
            height: 300,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(SSizes.sm),
              child: ListView(
                children: const [
                  Text('Daily expense'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
