import 'package:accountsb52z/screens/home/home_init_functions.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

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
          return Center(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black), // Add border for visualization
                  ),
                  child: Image.asset(
                    'assets/img/splash.png', // Replace 'assets/your_image.jpg' with your image path
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height /
                      3.5, // Adjust this value to position the indicator as per your requirement
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: CircularProgressIndicator(), // Loading animation
                  ),
                ),
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
