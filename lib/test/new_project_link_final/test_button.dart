// ignore_for_file: avoid_print

import 'package:accountsb52z/functions/firestoreFunctions/calculate_and_create_total_document.dart';
import 'package:accountsb52z/functions/firestoreFunctions/memberwise_update_pend_months_counts_monthly.dart';
import 'package:accountsb52z/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accountsb52z/functions/firestoreFunctions/update_pending_loan_amount_total.dart';
import 'package:accountsb52z/functions/firestoreFunctions/updating_new_months.dart';
import 'package:accountsb52z/functions/manualTriggeringFunctions/data_entry_using_loop.dart';
import 'package:accountsb52z/functions/manualTriggeringFunctions/update_pend_months_counts_whole.dart';
import 'package:accountsb52z/functions/pendingCalculationsDb/loan_pending_all_members_and_total.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/home_init_functions.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:accountsb52z/functions/firestoreFunctions/read_dashboard_data.dart';
import 'package:accountsb52z/test/new_project_link_final/test2.dart';
import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    void printcheck() {
      print("gesture detected");
    }

    return GestureDetector(
      onPanStart: (details) => printcheck(),
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          // Swipe to the right detected
        } else if (details.delta.dx < 0) {
          // Swipe to the left detected
        }
      },
      child: Scaffold(
        body: Center(
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Button Action
                // updateNewMonthInDB();
                // updateNewMonthInDB();
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
      ),
    );
  }
}
