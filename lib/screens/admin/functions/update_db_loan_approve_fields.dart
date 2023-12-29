import 'package:accountsb52z/screens/admin/admin_common_files.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateApprovedMonthDateAndEmiList() async {
  Map<String, bool> emiStatusInitializer = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
    '8': false,
    '9': false,
    '10': false,
  };
  final DocumentReference
      documentReferenceInsideupdateApprovedMonthDateAndEmiList =
      firestoreInstanceCall
          .collection('loan_installments')
          .doc(selectedDropdownValueAdmin);

  await documentReferenceInsideupdateApprovedMonthDateAndEmiList.set(
    {
      'emi_months_status': emiStatusInitializer,
      'approved_month_timestamp': Timestamp.now(),
      'emi_months': emiMonthsListIndexValued
    },
    SetOptions(merge: true),
  );
}
