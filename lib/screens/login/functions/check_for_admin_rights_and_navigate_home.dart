// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/login/functions/popup_alerts/loading_popup.dart';
import 'package:accountsb52z/screens/login/splash_screen/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> checkForAdminRightsAndNavigateSplashScreen(
    BuildContext contextInside, String userNameLocalInside) async {
  // Call firebase instance
  DocumentReference documentRef =
      firestoreInstanceCall.collection('authy_simple').doc(userNameLocalInside);

  DocumentSnapshot documentSnapshot = await documentRef.get();

  // Calling mounted check for BuildContext async warning after the await function.
  if (!contextInside.mounted) return;

  if (documentSnapshot['is_admin'] == true) {
    loggedUserAdminCheck = true;
    print('$userNameLocalInside is admin');
  }

  // Close loading popup before navigating to splash screen
  hideLoadingPopup(contextInside);

  // Navigate to the Home screen cleaning the push stack

  Navigator.pushAndRemoveUntil(
      contextInside,
      MaterialPageRoute(
        builder: (context) => const ScreenSplash(),
      ),
      (route) => false);
}
