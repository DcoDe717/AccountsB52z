import 'package:flutter/material.dart';

void selectAnyMemberPopupForLoanApproval(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Choose any member',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: const Text(
          'Select the member for loan approval.',
          style: TextStyle(
            fontSize: 18, // 18pt font
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'))
        ],
      );
    },
  );
}
