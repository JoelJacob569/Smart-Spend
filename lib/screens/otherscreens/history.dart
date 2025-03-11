import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        iconTheme: IconThemeData(
          color: dark ? SColors.white : SColors.black,
        ),
      ),
      body: const Center(
        child: Text('History'),
      ),
    );
  }
}
