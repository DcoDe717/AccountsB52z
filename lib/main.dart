// ignore_for_file: avoid_print
import 'dart:async';
import 'package:accountsb52z/functions/utils/reset_timer_function.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/about/about_screen.dart';
import 'package:accountsb52z/screens/login/login_screen_new.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:accountsb52z/test/new_project_link_final/test_button.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    // appleProvider: AppleProvider.appAttest,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    startIdleTimer();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: resetIdleTimer,
        onPanStart: (details) => resetIdleTimer(),
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swipe to the right detected
          } else if (details.delta.dx < 0) {
            // Swipe to the left detected
          }
        },
        child: MaterialApp(
          navigatorKey: navigatorKey, // Set the navigator key
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: const ScreenLoginNew(),
          routes: {'/home': (context) => const ScreenHome()},
          // navigatorObservers: [MyRouteObserver()]),
        ));
  }
}

// class MyRouteObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPush(route, previousRoute);
//     if (route.settings.name == '/') {
//       log('It is the login screen');

//     }
//   }
// }
