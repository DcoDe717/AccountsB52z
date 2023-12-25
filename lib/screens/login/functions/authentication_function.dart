// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/login/functions/check_for_admin_rights_and_navigate_home.dart';
import 'package:accounts3/screens/login/functions/popup_alerts/username_not_exist.dart';
import 'package:accounts3/screens/login/functions/popup_alerts/wrong_password_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> loginAuthentication(
    BuildContext passedCTX, String usernameLocal, String passwordLocal) async {
  // Call firebase instance
  DocumentReference documentRef =
      firestoreInstanceCall.collection('authy_simple').doc(usernameLocal);

  try {
    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      print('Document with username $usernameLocal exists.');

      if (documentSnapshot['cred_key'] == passwordLocal) {
        print('password is matching');
        checkForAdminRightsAndNavigateHomeScreen(passedCTX, usernameLocal);
      } else {
        print('password is wrong');
        wrongPassWordAlert(passedCTX, usernameLocal);
      }
    } else {
      showUsernameNotExistAlert(passedCTX, usernameLocal);
      print('Document with username $usernameLocal does not exist.');
    }
  } catch (e) {
    print('Error checking document existence: $e');
    // Handle the error, e.g., show a message to the user or log it.
  }
}
