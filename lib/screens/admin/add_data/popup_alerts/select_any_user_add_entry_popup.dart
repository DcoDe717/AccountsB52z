import 'package:flutter/material.dart';

void noMemberSelectedAddEntryScreenPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Select member.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: const Text(
          'Select any member for entry.',
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
