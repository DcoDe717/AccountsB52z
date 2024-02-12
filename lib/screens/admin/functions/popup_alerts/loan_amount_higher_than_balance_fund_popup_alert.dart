import 'package:accountsb52z/screens/admin/admin_common_files.dart';
import 'package:flutter/material.dart';

void showLoanAmountIsHigherThanBalancePopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
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
        actions: <Widget>[
          TextButton(
              onPressed: () {
                // Clear the loan amount text field
                loanAmountTextControllerLoanApproveScreen.clear();
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'))
        ],
      );
    },
  );
}
