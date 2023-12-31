import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void showLoanActiveCheckTruePopup(
    BuildContext context, String? memberName) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Loan Is Active.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          'Loan is currently active for $memberName, finish the active loan first',
          style: const TextStyle(
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