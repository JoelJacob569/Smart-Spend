import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/custom/or_divider.dart';

class Addbill extends StatefulWidget {
  const Addbill({super.key});

  @override
  State<Addbill> createState() => _AddbillState();
}

class _AddbillState extends State<Addbill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.sm),
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Expense Type',
                    hintText: 'Enter the expense type',
                  ),
                ),
                const SizedBox(height: SSizes.smd),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Expense amount',
                    hintText: 'Enter the expense amount',
                  ),
                ),
                const SizedBox(height: SSizes.smd),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
            const SizedBox(height: SSizes.smd),
            const OrDivider(),
            const SizedBox(height: SSizes.smd),
            ElevatedButton(
              onPressed: () {
                showbottomsheet();
              },
              child: const Text("Add Bill"),
            ),
          ],
        ),
      ),
    );
  }

  void showbottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(SImages.files),
                        ),
                      ),
                    ),
                    const Text('Files')
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      size: 50,
                    ),
                  ),
                  const Text('Camera')
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
