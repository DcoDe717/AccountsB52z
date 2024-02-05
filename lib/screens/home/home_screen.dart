// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/admin/loan_approve/loan_approve_screen.dart';
import 'package:accountsb52z/screens/home/homepages/01_piechart_total/dashboardview_screen.dart';
import 'package:accountsb52z/screens/home/homepages/02_total_pending_view/member_solo_dashboard_screen.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:accountsb52z/screens/login/login_screen.dart';
import 'package:accountsb52z/screens/login/login_screen_new.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:accountsb52z/screens/home/homepages/01_piechart_total/total_piechart_screen.dart';
import 'package:accountsb52z/screens/home/homepages/02_total_pending_view/total_pendingview_screen.dart';
import 'package:flutter/material.dart';
import '../admin/add_data/add_data_screen.dart';
import 'homepages/03_individual_listview/individual_listview_screen.dart';
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
    ScreenHomeDashboard(),
    ScreenUserPendingView(),
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
            builder: (context) => const ScreenLoginNew(),
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
    // if (index == 1) {
    //   switchCaseRetrievedValueMonthly =
    //       totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;
    //   switchCaseRetrievedValueLoan = loanTotalPendingFundPulledDB;
    // }

    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AccountsB52z')),
        body:
            // Reset the timer on any user interaction (e.g., tap)
            GestureDetector(
          onTap: _resetIdleTimer,
          child: _pageList[_selectedNavIndex],
        ),
        bottomNavigationBar: bottomNavHome(
            loggedUserAdminCheck ? botNavItemAdmin : botNavItemNonAdmin),
        drawer: drawerUser());
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
          showAdminActionPopup(context);
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

  void showAdminActionPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow dismissal by tapping outside
      builder: (BuildContext context) {
        return SimpleDialog(
          // Optional title (you can comment it out if not needed)
          // title: const Text("Choose an action"),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[300],
                  child: InkWell(
                    onTap: () {
                      // Handle Add Fees tap
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenAddData(),
                          ),
                          (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Add Entry',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[300],
                  child: InkWell(
                    onTap: () {
                      // Handle Add Fees tap
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenLoanApprove(),
                          ),
                          (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Approve Loan',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // TextButton(
            //   onPressed: () {
            //     // Handle "Add Entry" button press
            //     Navigator.pop(context); // Close dialog
            //     // Add your specific action here
            //   },
            //   child: const Text("Add Entry"),
            // ),
            // const SizedBox(height: 10.0), // Spacing between buttons
            // TextButton(
            //   onPressed: () {
            //     // Handle "Approve Loan" button press
            //     Navigator.pop(context); // Close dialog
            //     // Add your specific action here
            //   },
            //   child: const Text("Approve Loan"),
            // ),
          ],
        );
      },
    );
  }

  Widget drawerUser() {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // KNUP Logo
              DrawerHeader(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'B.Fighters',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 45, color: Colors.white, letterSpacing: 8),
                  )),

              // SizedBox(height: 20),

              // Home

              const Padding(
                padding: EdgeInsets.only(top: 20, left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Admin
              Visibility(
                visible: true,
                child: GestureDetector(
                  onTap: () {
                    showAdminActionPopup(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading:
                          LineIcon.userShield(color: Colors.white, size: 25),
                      title: Text(
                        'Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              // Info
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // Logout

          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenLoginNew(),
                  ),
                  (route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
