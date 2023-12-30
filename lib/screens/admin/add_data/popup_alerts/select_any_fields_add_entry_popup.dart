import 'package:flutter/material.dart';

void selectAnyFieldAddEntryScreenPopup(BuildContext context, String? userName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'No Fields Selected.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          'Please select any fields for the $userName for the entry in database.',
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
