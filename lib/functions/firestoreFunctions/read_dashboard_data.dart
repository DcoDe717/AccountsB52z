// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/02_total_pending_view/utils/switchcase_value_retrievel.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> readAllDbDashboardData() async {
  List<dynamic> localListMonthlyPendingCount = [];
  monthyPendingCountListMemberWise = [];
  List<dynamic> localListLoanPendingAmount = [];
  pendingLoanAmountAllMembersPulledDB = [];

  try {
    final docRef01 =
        firestoreInstanceCall.collection('dashboard').doc('gross_total_docs');

    final docRef02 = firestoreInstanceCall
        .collection('dashboard')
        .doc('total_doc_values_monthly');

    DocumentSnapshot grossTotal = await docRef01.get();
    DocumentSnapshot monthlyTotDoc = await docRef02.get();

    // Reading monthly_pending_count_list_all_members
    localListMonthlyPendingCount =
        grossTotal['monthly_pending_count_list_all_members'];

    monthyPendingCountListMemberWise = localListMonthlyPendingCount
        .map((dynamic item) => item as int)
        .toList();

    // Calculating total monthly pending amount of whole members gross.
    totalMonthlyPendingAmountCalcFromMemberWiseCountList =
        (monthyPendingCountListMemberWise
                .reduce((value, element) => value + element)) *
            500;

    // print(
    //     "monthyPendingCountListMemberWise : $monthyPendingCountListMemberWise");

    // Reading loan_pending_amount_list_all_members
    localListLoanPendingAmount =
        grossTotal['loan_pending_amount_list_all_members'];

    pendingLoanAmountAllMembersPulledDB = localListLoanPendingAmount
        .map((dynamic item) => item as double)
        .toList();

    // print(
    //     "pendingLoanAmountAllMembersPulledDB : $pendingLoanAmountAllMembersPulledDB");

    totalFundRecievedStoringFromDB =
        (monthlyTotDoc['total_fund_recieved_from_true_count_monthly'])
            .toDouble();
    // print("totalFundRecievedStoringFromDB : $totalFundRecievedStoringFromDB");

    balanceFundTotalPulledFromDB =
        (grossTotal['total_balance_fund_whole']).toDouble();

    // print("balanceFundTotalPulledFromDB : $balanceFundTotalPulledFromDB");

    // Calculate total fund expected
    totalFundRecievedPulledFromDB =
        (monthlyTotDoc['total_fund_recieved_from_true_count_monthly'])
            .toDouble();

    totalFundExpectedCalculatedLocal = totalFundRecievedStoringFromDB +
        totalMonthlyPendingAmountCalcFromMemberWiseCountList;

    // print(
    //     "totalFundExpectedCalculatedLocal : $totalFundExpectedCalculatedLocal");

    switchcaseNameToValueRetrievelFuction(userNameGlobal);
  } catch (e) {
    print("Error Catched (readAllDbDashboardData) : $e");
    log("Error Catched (readAllDbDashboardData) : $e");
  }

  return 0;
}
