// // ignore_for_file: avoid_print

// import 'package:accountsb52z/screens/global/global_variables.dart';
// import 'package:accountsb52z/screens/login/functions/check_for_admin_rights_and_navigate_home.dart';
// import 'package:accountsb52z/screens/login/functions/popup_alerts/username_not_exist.dart';
// import 'package:accountsb52z/screens/login/functions/popup_alerts/wrong_password_popup.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// Future<void> longProcess(
//     BuildContext passedCTX, String usernameLocal, String passwordLocal) async {
//   // Call firebase instance
//   DocumentReference documentRef =
//       firestoreInstanceCall.collection('simple').doc(usernameLocal);

//   try {
//     DocumentSnapshot documentSnapshot = await documentRef.get();

//     if (documentSnapshot.exists) {

//       if (documentSnapshot['key'] == passwordLocal) {
//         checkForAdminRightsAndNavigateSplashScreen(passedCTX, usernameLocal);
//       } else {
//         wrongPassWordAlert(passedCTX, usernameLocal);
//       }
//     } else {
//       showUsernameNotExistAlert(passedCTX, usernameLocal);
//     }
//   } catch (e) {
//     print('Error checking document existence: $e');
//     // Handle the error, e.g., show a message to the user or log it.
//   }
// }
