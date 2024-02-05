import 'package:accountsb52z/screens/home/home_init_functions.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeScreenInitFunctionsOrdered(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AlertDialog(
            content: Row(
              children: [
                LoadingAnimationWidget.dotsTriangle(color: Colors.black, size: 80),
                const SizedBox(width: 16),
                const Text("Loading...",style: TextStyle(fontSize: 25),),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenHome()),
            );
          });
          return Container(); // return an empty container
        }
      },
    );
  }
}
