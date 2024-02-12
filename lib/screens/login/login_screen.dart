// import 'package:accountsb52z/screens/admin/admin_common_files.dart';
// import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
// import 'package:accountsb52z/screens/login/functions/authentication_function.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ScreenLogin extends StatelessWidget {
//   const ScreenLogin({Key? key}) : super(key: key);
  

//   @override
//   Widget build(BuildContext context) {
//     final width1 = MediaQuery.of(context).size.width / 1.25;
//     final width2 = width1 / 1.25;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                 Colors.purpleAccent,
//                 Color.fromARGB(255, 39, 37, 182),
//                 Colors.blue,
//               ])),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(height: 50),
//               SizedBox(
//                 height: 200,
//                 width: 300,
//                 child: Image.asset('assets/img/login_art.png'),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: width1,
//                 height: 400,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 30),
//                     const Text(
//                       "Hello",
//                       style:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Please Login to Your Account",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     SizedBox(
//                       width: width2,
//                       height: 60,
//                       child: TextField(
//                         controller: loginUsernameTextController,
//                         decoration: const InputDecoration(
//                             suffix: Icon(
//                               FontAwesomeIcons.user,
//                               color: Colors.red,
//                             ),
//                             labelText: "Username",
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             )),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       width: width2,
//                       height: 60,
//                       child: TextField(
//                         controller: loginPasswordTextController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                             suffix: Icon(
//                               FontAwesomeIcons.eyeSlash,
//                               color: Colors.red,
//                             ),
//                             labelText: "Password",
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             )),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Forget Password",
//                               style: TextStyle(color: Colors.deepOrange),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       width: 250,
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 Color(0xFF8A2387),
//                                 Color(0xFFE94057),
//                                 Color(0xFFF27121),
//                               ])),
//                       child: Padding(
//                         padding: const EdgeInsets.all(1.0),
//                         child: TextButton(
//                             onPressed: () {
//                               userNameGlobal = loginUsernameTextController.text;

//                               String passWord =
//                                   loginPasswordTextController.text;

//                               loginPasswordTextController.clear();

//                               loginAuthentication(
//                                   context, userNameGlobal, passWord);

//                               // Navigator.of(context).pushNamed('/home');
//                             },
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
