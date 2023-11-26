import 'package:accounts3/screens/admin/loan_approve/loan_approve_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:accounts3/screens/home/piechart_total/total_piechart_screen.dart';
import 'package:accounts3/screens/home/total_pending_view/total_pendingview_screen.dart';
import 'package:flutter/material.dart';
import '../admin/add_data/add_data_screen.dart';
import 'individual_listview/individual_listview_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _selectedNavIndex = 0;
  
  static const List _pageList = [
    ScreenHomePieChartView(),
    ScreenTotPendingView(),
    ScreenMembersPendingListView(),
    ScreenAddData()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageList[_selectedNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings_outlined), label: '')
          ],
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
                          builder: (context) => ScreenAddData(),
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
                          builder: (context) => ScreenLoanApprove(),
                        ),
                        (route) => false),
                        color: Color.fromARGB(255, 23, 109, 190),
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
        ));
  }
}


//old comments
// {
//             if (isAdmin) {
//               if (updatedIndex == 3) {
//                 return _pages[updatedIndex];
//               }
//             } else {
//               if (updatedIndex == 3) {
//                 return _pages[4];
//               }
//             }
//             return _pages[updatedIndex];
//           },