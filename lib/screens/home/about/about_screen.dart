// ignore_for_file: avoid_print

import 'package:accountsb52z/functions/utils/reset_timer_function.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set background color
        body: Center(
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
                  'assets/img/about_screen.png', // Replace 'assets/your_image.jpg' with your image path
                  fit: BoxFit.cover, // Adjust the fit property as needed
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        resetIdleTimer();
                
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenHome(),
                            ),
                            (route) => false);
                      },
                      icon:  Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.red[600],
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
