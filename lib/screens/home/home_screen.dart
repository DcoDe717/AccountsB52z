// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/admin/loan_approve/loan_approve_screen.dart';
import 'package:accountsb52z/screens/home/common_variables_homepage.dart';
import 'package:accountsb52z/screens/login/login_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:accountsb52z/screens/home/piechart_total/total_piechart_screen.dart';
import 'package:accountsb52z/screens/home/total_pending_view/total_pendingview_screen.dart';
import 'package:flutter/material.dart';
import '../admin/add_data/add_data_screen.dart';
import 'individual_listview/individual_listview_screen.dart';
import 'dart:async';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _selectedNavIndex = 0;
  late Timer _idleTimer;

  static const List _pageList = [
    ScreenHomePieChartView(),
    ScreenTotPendingView(),
    ScreenMembersPendingListView(),
    ScreenAddData()
  ];

  @override
  void initState() {
    super.initState();
    _startIdleTimer();

    // homeScreenInitFunctionsOrdered();
  }

  void _startIdleTimer() {
    const Duration idleDuration =
        Duration(minutes: 5); // Adjust the idle duration as needed

    _idleTimer = Timer(idleDuration, () {
      // Perform actions when the user is idle

      print('User is idle.');

      // Navigate to the login screen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenLogin(),
          ),
          (route) => false);
    });
  }

  void _resetIdleTimer() {
    _idleTimer.cancel(); // Cancel the existing timer
    _startIdleTimer(); // Restart the timer
  }

  // _ScreenHomeState() {
  //   // Call your initialization function here

  //   totPendingCountMemberWiseList(membersListLocal);
  //   calculateTotalBalanceFundWhole();
  //   getTotalBalanceFundDb();
  // }

  void _onItemTapped(int index) {
    if (index == 1) {
      switchCaseRetrievedValueMonthly =
          totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;
      switchCaseRetrievedValueLoan = loanTotalPendingFundPulledDB;
    }

    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // Reset the timer on any user interaction (e.g., tap)
            GestureDetector(
          onTap: _resetIdleTimer,
          child: _pageList[_selectedNavIndex],
        ),
        bottomNavigationBar: bottomNavHome(
            loggedUserAdminCheck ? botNavItemAdmin : botNavItemNonAdmin));
  }

  @override
  void dispose() {
    _idleTimer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Widget bottomNavHome(List<BottomNavigationBarItem> botNavItemLocal) {
    return BottomNavigationBar(
      items: botNavItemLocal,
      onTap: (value) {
        if (value == 3) {
          Alert(
            context: context,
            // type: AlertType.warning,
            // image: Image.asset("assets/img/choose.png"),
            title: "Choose Operation",
            desc: "Credit - for adding entry\nDebit - for approving loan",
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAddData(),
                    ),
                    (route) => false),
                color: const Color.fromARGB(255, 230, 46, 55),
                child: const Text(
                  "Credit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              DialogButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenLoanApprove(),
                    ),
                    (route) => false),
                color: const Color.fromARGB(255, 23, 109, 190),
                // gradient: const LinearGradient(colors: [
                //   Color.fromRGBO(116, 116, 191, 1.0),
                //   Color.fromRGBO(52, 138, 199, 1.0)
                // ]),
                child: const Text(
                  "Debit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ).show();
        }

        if (value == 0 || value == 1 || value == 2) {
          _onItemTapped(value);
        }
        // _onItemTapped(value);
      },
      currentIndex: _selectedNavIndex,
      // backgroundColor:Color(0xffE6EFFF),

      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      selectedIconTheme: const IconThemeData(size: 30),
    );
  }

  List<BottomNavigationBarItem> botNavItemNonAdmin = const [
    BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: '')
  ];

  List<BottomNavigationBarItem> botNavItemAdmin = const [
    BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.admin_panel_settings_outlined), label: '')
  ];
}
