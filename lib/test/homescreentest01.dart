import 'package:accountsb52z/screens/home/homepages/01_piechart_total/dashboardview_screen.dart';
import 'package:accountsb52z/screens/home/homepages/02_total_pending_view/member_solo_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';

class ScreenHomeUser extends StatefulWidget {
  const ScreenHomeUser({super.key});

  @override
  State<ScreenHomeUser> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHomeUser> {
  int selectedPageIndex = 0;

  static const List pageList = [
    ScreenHomeDashboard(),ScreenUserPendingView()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarUser(),
        body: pageList[selectedPageIndex],
        bottomNavigationBar: bottomNavHome(),
        drawer: drawerUser());
  }
  //Main Widget Ends Here.

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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ScreenHomeAdmin()),
                    // );
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
              // Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const ScreenLogin()),
              //       );
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

  PreferredSizeWidget appBarUser() {
    return AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ));
  }

  Widget bottomNavHome() {
    List<BottomNavigationBarItem> botNavItems = const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.people_sharp), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.add_moderator_sharp), label: ''),
    ];
    return BottomNavigationBar(
      items: botNavItems,
      onTap: (value) {
        setState(() {
          selectedPageIndex = value;
        });
      },
      currentIndex: selectedPageIndex,
      // backgroundColor:Color(0xffE6EFFF),

      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[400],
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      selectedIconTheme: const IconThemeData(size: 30),
    );
  }
}
