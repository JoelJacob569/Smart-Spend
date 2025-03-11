import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final darkm = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        iconTheme: IconThemeData(
          color: darkm ? SColors.white : SColors.black,
        ),
      ),
      body: const Center(
        child: Text('No Notifications'),
      ),
    );
  }
}
