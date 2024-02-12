// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/login/functions/check_for_admin_rights_and_navigate_home.dart';
import 'package:accountsb52z/screens/login/functions/popup_alerts/loading_popup.dart';
import 'package:accountsb52z/screens/login/functions/popup_alerts/username_not_exist.dart';
import 'package:accountsb52z/screens/login/functions/popup_alerts/wrong_password_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> loginAuthentication(
    BuildContext passedCTX, String usernameLocal, String passwordLocal) async {
  if (usernameLocal.isEmpty || passwordLocal.isEmpty) {
  } else {
    // Show loading popup when starting the long process
    showLoadingPopup(passedCTX);

    // Call firebase instance
    DocumentReference documentRef =
        firestoreInstanceCall.collection('authy_simple').doc(usernameLocal);

    try {
      DocumentSnapshot documentSnapshot = await documentRef.get();

      if (documentSnapshot.exists) {
        print('Document with username $usernameLocal exists.');

        if (documentSnapshot['cred_key'] == passwordLocal) {
          print('password is matching');

          checkForAdminRightsAndNavigateSplashScreen(passedCTX, usernameLocal);
        } else {
          // Close loading popup before showing the wrong password alert
          hideLoadingPopup(passedCTX);

          print('password is wrong');

          wrongPassWordAlert(passedCTX, usernameLocal);
        }
      } else {
        // Close loading popup before showing the username not exist alert
        hideLoadingPopup(passedCTX);

        showUsernameNotExistAlert(passedCTX, usernameLocal);

        print('Document with username $usernameLocal does not exist.');
      }
    } catch (e) {
      print('Error checking document existence: $e');
      // Handle the error, e.g., show a message to the user or log it.

      // Close loading popup in case of an error
      hideLoadingPopup(passedCTX);
    }
  }
}
