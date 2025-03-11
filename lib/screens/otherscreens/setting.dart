import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isenabled = false;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.sm),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifaications',
                  style: TextStyle(fontSize: SSizes.fontSizeLg),
                ),
                Switch(
                  value: isenabled,
                  onChanged: (value) {
                    setState(() {
                      isenabled = value;
                    });
                  },
                )
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
