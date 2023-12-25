// Function to show confirmation alert to the screen and navigate to Home screen after 2 seconds
import 'package:accounts3/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void showLoanApprovedAlertAndNavigate(
    BuildContext context, int? approvedAmount, String? approvedToMember) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Loan Approved.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          '₹ ${approvedAmount.toString()} approved for $approvedToMember',
          style: const TextStyle(
            fontSize: 18, // 18pt font
          ),
        ),
      );
    },
  );

  // Delay for 2 seconds using a Timer
  Timer(const Duration(seconds: 2), () {
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