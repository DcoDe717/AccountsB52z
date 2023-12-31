import 'package:flutter/material.dart';

void showUsernameNotExistAlert(BuildContext context, String? userName) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Usename Not Exists.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          'The provided username: $userName does not exist, Looks like you got a typo in your username there.',
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
