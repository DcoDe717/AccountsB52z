// ignore_for_file: avoid_print

import 'package:accounts3/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accounts3/functions/firestoreFunctions/update_pending_loan_amount_total.dart';
import 'package:accounts3/screens/admin/admin_common_files.dart';
import 'package:accounts3/screens/admin/common_variables_admin.dart';
import 'package:accounts3/screens/admin/functions/clear_state_loan_approval_screen.dart';
import 'package:accounts3/screens/admin/functions/months_emi_calculator_func.dart';
import 'package:accounts3/screens/admin/functions/popup_alerts/loan_active_popup_alert.dart';
import 'package:accounts3/screens/admin/functions/popup_alerts/loan_amount_higher_than_balance_fund_popup_alert.dart';
import 'package:accounts3/screens/admin/functions/popup_alerts/show_loan_approved_alert_and_navigate.dart';
import 'package:accounts3/screens/admin/functions/update_db_loan_approve_fields.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> loanApprovalProcess(
    String? memberCheckLoanActive, BuildContext ctxCheckLoanActive) async {
  print('checkLoanActive passed value is $memberCheckLoanActive');
  // Get the document reference
  final DocumentReference documentReferenceInsideCheckLoanActiveFunction =
      firestoreInstanceCall
          .collection('loan_installments')
          .doc(memberCheckLoanActive);
  try {
    // Get the document snapshot
    final DocumentSnapshot snapshot =
        await documentReferenceInsideCheckLoanActiveFunction.get();

    // Check if the document exists and 'isActive' is true / level 0 (if)
    if (snapshot.exists &&
        (snapshot.data() as Map<String, dynamic>)['is_loan_active'] == true) {
      showLoanActiveCheckTruePopup(ctxCheckLoanActive, memberCheckLoanActive);
      print(
          'Loan is active, cannot approve anymore loan, finish the active loan first');
      // Calling state clearing function after loan is approved
      stateClear();
    }
    // level 0 (else)
    else {
      print('Loan is not active, please avail new loan');

      loanAmountTextFromTextController =
          loanAmountTextControllerLoanApproveScreen.text.trim();

      // level 1 (if)
      if (loanAmountTextFromTextController.isNotEmpty) {
        // Attempt to parse the input as an integer
        loanAmountParsed = int.tryParse(loanAmountTextFromTextController);

        // level 2 (if)
        if (loanAmountParsed != null) {
          // Valid integer, continue processing

          // level 3 (if)
          if (loanAmountParsed! < balanceFundTotalPulledFromDB) {
            // Main Section: Your logic here
            print('loan can be approved since amount is less than balance');

            commentsTextFromTextControllerLoanApproveScreen =
                commentsTextControllerLoanApproveScreen.text.trim();

            print(
                'commentsTextControllerLoanApproveScreen.text.trim() :  $commentsTextFromTextControllerLoanApproveScreen');

            // Create or update the required fields in the document for loan approval
            await documentReferenceInsideCheckLoanActiveFunction.set(
              {
                'is_loan_active': true,
                'loan_amount': loanAmountParsed,
                'comments_loan_approve':
                    'Approved by $userNameGlobal | $commentsTextFromTextControllerLoanApproveScreen',
                'loan_amount_pending_to_pay': loanAmountParsed
              },
              SetOptions(merge: true),
            );

            approvedMonthAndEMIMonthsListCreator();
            await updateApprovedMonthDateAndEmiList();
            await calculateTotalPendingLoanAmount();
            await calculateTotalBalanceFundWhole();

            // Calling Confirmation popup for 2 seconds and navigate to Homescreen
            showLoanApprovedAlertAndNavigate(
                ctxCheckLoanActive, loanAmountParsed, memberCheckLoanActive);

            // Calling state clearing function after loan is approved
            stateClear();
          }
          // level 3 (else)
          else {
            showLoanAmountIsHigherThanBalancePopup(ctxCheckLoanActive);
            // Calling state clearing function after loan is approved
            stateClear();

            print('loan cannot be provided since balance fund is not enough');
          }
        }
        // level 2 (else)
        else {
          print('Invalid loan amount format');
        }
      }
      // level 1 (else)
      else {
        print('Loan amount is empty');
      }

      // if (int.parse(loanAmountTextControllerLoanApproveScreen.text) <
      //     currentBalanceValue) {
      //   print(
      //       'Insufficient Balance Fund, please choose lesser amount, below: $currentBalanceValue');
      // }
    }
  } catch (e) {
    print('Error checking loan status: $e');
    // Handle errors as needed
  }
}
