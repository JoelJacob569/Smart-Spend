import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/text_strings.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Addmembers extends StatefulWidget {
  const Addmembers({super.key});

  @override
  State<Addmembers> createState() => _AddmembersState();
}

class _AddmembersState extends State<Addmembers> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(STexts.addmem),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: STexts.uid,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: STexts.name,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: STexts.relation,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text(STexts.add),
            )
          ],
        ),
      ),
    );
  }
}
