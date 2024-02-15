// ignore_for_file: avoid_print

import 'dart:async';
import 'package:accountsb52z/screens/admin/add_data/functions/state_clear_add_entry.dart';
import 'package:accountsb52z/screens/admin/functions/clear_state_loan_approval_screen.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/login/login_screen_new.dart';
import 'package:flutter/material.dart';

late Timer _idleTimer;

void startIdleTimer() {
  // Check current route

  print('reset timer started');
  const Duration idleDuration =
      Duration(minutes: 5); // Adjust the idle duration as needed

  _idleTimer = Timer(idleDuration, () {
    // Perform actions when the user is idle

    print('User is idle.');
    startIdleTimer();

    // State Clearing since moving to login screen
    stateClearAddEnrtyScreen();
    stateClearLoanApprovalScreen();

    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentState!.context,
        MaterialPageRoute(
          builder: (context) => const ScreenLoginNew(),
        ),
        (route) => false);
  });
}

void resetIdleTimer() {
  _idleTimer.cancel(); // Cancel the existing timer
  startIdleTimer(); // Restart the timer
}
