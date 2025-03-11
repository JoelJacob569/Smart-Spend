import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:smartspend/utils/constants/sizes.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  final _loanAmountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _tenureController = TextEditingController();

  double emi = 0.0;
  double totalInterest = 0.0;
  double totalAmount = 0.0;

  bool isTenureInYears = true;

  void calculateEMI() {
    try {
      final loanAmount = double.parse(_loanAmountController.text);
      final interestRate = double.parse(_interestRateController.text);
      final tenure = int.parse(_tenureController.text);

      if (loanAmount <= 0 || interestRate <= 0 || tenure <= 0) {
        throw Exception('Please enter valid positive values.');
      }

      final monthlyInterestRate = interestRate / 12 / 100;
      final tenureInMonths = tenure * (isTenureInYears ? 12 : 1);

      emi = (loanAmount *
              monthlyInterestRate *
              pow(1 + monthlyInterestRate, tenureInMonths)) /
          (pow(1 + monthlyInterestRate, tenureInMonths) - 1);

      totalInterest = emi * tenureInMonths - loanAmount;
      totalAmount = loanAmount + totalInterest;

      // Round off the calculated values
      emi = double.parse(emi.toStringAsFixed(2));
      totalInterest = double.parse(totalInterest.toStringAsFixed(2));
      totalAmount = double.parse(totalAmount.toStringAsFixed(2));

      setState(() {});
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Please ensure all fields are filled correctly with valid numbers.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _loanAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Loan Amount',
                hintText: 'Enter loan amount',
              ),
            ),
            const SizedBox(height: SSizes.smd),
            TextFormField(
              controller: _interestRateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Interest Rate (%)',
                hintText: 'Enter annual interest rate',
              ),
            ),
            const SizedBox(height: SSizes.smd),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _tenureController,
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
            const SizedBox(height: SSizes.smd),
            ElevatedButton(
              onPressed: calculateEMI,
              child: const Text('Calculate EMI'),
            ),
            if (emi > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: SSizes.smd),
                  Text(
                    'EMI: ${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(emi)}',
                    style: const TextStyle(fontSize: SSizes.fontSizeMd),
                  ),
                  Text(
                    'Total Interest: ${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(totalInterest)}',
                    style: const TextStyle(fontSize: SSizes.fontSizeMd),
                  ),
                  Text(
                    'Total Amount: ${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(totalAmount)}',
                    style: const TextStyle(fontSize: SSizes.fontSizeMd),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
