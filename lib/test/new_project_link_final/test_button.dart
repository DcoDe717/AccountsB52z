// ignore_for_file: avoid_print

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

                // dataLoopAddDbEntryMemberWiseOrFull();
                // calculateAndCreateTotalDocument();
                // updatePendingMonthsAndCountWhole();
                // calculateTotalPendingLoanAmount();
                // calculateTotalBalanceFundWhole();
                // approvedMonthAndEMIMonthsListCreator();
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
