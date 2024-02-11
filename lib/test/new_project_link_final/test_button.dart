import 'package:accountsb52z/functions/firestoreFunctions/calculate_and_create_total_document.dart';
import 'package:accountsb52z/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accountsb52z/functions/firestoreFunctions/update_pending_loan_amount_total.dart';
import 'package:accountsb52z/functions/manualTriggeringFunctions/data_entry_using_loop.dart';
import 'package:accountsb52z/functions/manualTriggeringFunctions/update_pend_months_counts_whole.dart';
import 'package:accountsb52z/screens/admin/functions/months_emi_calculator_func.dart';
import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: ElevatedButton.icon(
            onPressed: () {
              // Button Action

              // dataLoopAddDbEntryMemberWiseOrFull();
              // calculateAndCreateTotalDocument();
              // updatePendingMonthsAndCountWhole();
              // calculateTotalPendingLoanAmount();
              // calculateTotalBalanceFundWhole();
              approvedMonthAndEMIMonthsListCreator();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(
                  20), // Increase padding to make button bigger
            ),
            icon: const Icon(Icons.star), // Add icon to the button
            label: const Text('Run'), // Button text
          ),
        ),
      ),
    );
  }
}