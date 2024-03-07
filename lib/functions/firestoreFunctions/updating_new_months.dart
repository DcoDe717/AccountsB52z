// ignore_for_file: avoid_print
import 'dart:developer';
import 'package:accountsb52z/functions/firestoreFunctions/calculate_and_create_total_document.dart';
import 'package:accountsb52z/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accountsb52z/functions/manualTriggeringFunctions/update_pend_months_counts_whole.dart';
import 'package:accountsb52z/functions/pendingCalculationsDb/loan_pending_all_members_and_total.dart';
import 'package:accountsb52z/functions/pendingCalculationsDb/monthly_pending_all_members_and_total.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int monthsPassedSince(DateTime fromDate) {
  DateTime currentDate = DateTime.now();

  int months = (currentDate.year - fromDate.year) * 12 +
      currentDate.month -
      fromDate.month;
  months++;

  return months;
}

Future<void> updateNewMonthInDB() async {
  List<String> membersList = [
    'adil',
    'akku',
    'cheppu',
    'dillu',
    'ismail',
    'jasim',
    'rishin',
    'sabith',
    'shammas',
    'sherbi',
    'sulfi',
    'vahab'
  ];

  var document1 = <String, dynamic>{};

  final dbcall2 = firestoreInstanceCall.collection('monthly_installment');
  int lastMonthIndex = 0;

  try {
    // Get the current latest DB month index
    final docRef =
        firestoreInstanceCall.collection('dashboard').doc('index_track');

    // Fetch the document data
    final DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      lastMonthIndex = docSnapshot['live_index'] as int;

      // log("indexPulled : $lastMonthIndex");

      int currentMonthIndex = monthsPassedSince(DateTime(2020, 4));

      if (lastMonthIndex < currentMonthIndex) {

        print("Running updateNewMonthInDB");
        // Updating the month in the DB
        for (var i = 0; i < 12; i++) {
          for (var idx = lastMonthIndex + 1; idx <= currentMonthIndex; idx++) {
            document1 = <String, dynamic>{
              "ispaid_monthly": {'$idx': false},
            };

            // Now you can use document1 to update Firestore
            await dbcall2
                .doc(membersList[i])
                .set(document1, SetOptions(merge: true));
          }
        }

        await updatePendingMonthsAndCountWhole();
        await calculateAndCreateTotalDocument();
        await calculateTotalBalanceFundWhole();
        await totPendingCountMemberWiseListMonthlyUpdate(membersListLocal);
        await totPendingCountMemberWiseListLoan(membersListLocal);
        await docRef.update({'live_index':currentMonthIndex});
      }
    } else {
      log('Document does not exist');
    }
  } catch (e) {
    log('Error retrieving document: $e');
  }
}
