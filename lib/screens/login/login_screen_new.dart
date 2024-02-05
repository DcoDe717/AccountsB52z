// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/admin_common_files.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/login/functions/authentication_function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenLoginNew extends StatefulWidget {
  const ScreenLoginNew({super.key});

  @override
  State<ScreenLoginNew> createState() => _ScreenLoginNewState();
}

class _ScreenLoginNewState extends State<ScreenLoginNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.android, size: 100),
              const SizedBox(height: 70),
              Text(
                'Hello Again',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome back, how's your day.  : )",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 50),
              // Username box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: loginUsernameTextController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Username'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: loginPasswordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //Sign in button
              GestureDetector(
                onTap: () {
                  userNameGlobal = loginUsernameTextController.text;
                  

                  String passWord = loginPasswordTextController.text;
                  

                  loginPasswordTextController.clear();

                  loginAuthentication(context, userNameGlobal, passWord);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text('Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not having an account ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' Register now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
