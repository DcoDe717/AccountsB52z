import 'package:flutter/material.dart';

void wrongPassWordAlert(BuildContext context, String? userName) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Incorrect password !',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0), // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          'The provided password for $userName is wrong, Please try again or contact Dillu for the password reset.',
          style: const TextStyle(
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
