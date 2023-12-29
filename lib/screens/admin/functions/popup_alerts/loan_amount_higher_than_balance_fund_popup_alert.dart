import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void showLoanAmountIsHigherThanBalancePopup(
    BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Insufficient Fund.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: const Text(
          'Loan cannot be provided since balance fund is not enough',
          style: TextStyle(
            fontSize: 18, // 18pt font
          ),
        ),
      );
    },
  );

  // Delay for 2 seconds using a Timer
  Timer(const Duration(seconds: 3), () {
    // Close the alert dialog
    Navigator.pop(context);

    // Navigate to the Home screen cleaning the push stack
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenHome(),
        ),
        (route) => false);
  });
}