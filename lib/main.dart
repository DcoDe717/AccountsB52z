// import 'package:accountstwo/rough1.dart';
// import 'package:accountstwo/screens/adminpages/adddata/adddata.dart';
// import 'package:accountstwo/screens/adminpages/adddata/select_entry_fields.dart';
// import 'package:accountstwo/screens/home/home_screen.dart';
// import 'package:accountstwo/screens/adminpages/loanapprove/loan_approve.dart';
// import 'package:accountstwo/screens/homepiechart/homepiechartview.dart';
// import 'package:accountstwo/screens/login/login.dart';
// import 'package:accountstwo/screens/totpendingview/totpendingview.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:accounts3/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

// import 'screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home:  ScreenLogin(),
      // routes: {'/home': (context) => const ScreenHome()},
    );
  }
}
