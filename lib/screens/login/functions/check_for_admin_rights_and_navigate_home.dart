// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/common_variables_admin.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> checkForAdminRightsAndNavigateHomeScreen(
    BuildContext contextInside, String userNameLocalInside) async {
  // Call firebase instance
  DocumentReference documentRef =
      firestoreInstanceCall.collection('authy_simple').doc(userNameLocalInside);

  DocumentSnapshot documentSnapshot = await documentRef.get();

  if (documentSnapshot['is_admin'] == true) {
    loggedUserAdminCheck = true;
    print('$userNameLocalInside is admin');
  }

  // Navigate to the Home screen cleaning the push stack

  Navigator.pushAndRemoveUntil(
      contextInside,
      MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ),
      (route) => false);
}
