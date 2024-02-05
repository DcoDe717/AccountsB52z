// AppBar(
//           elevation: 1,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               Color.fromARGB(202, 237, 123, 132),
//               Color.fromARGB(195, 144, 85, 255)
//             ])),
//           ),
//           leading: IconButton(
//             onPressed: () {
//               stateClearLoanApprovalScreen();
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ScreenHome(),
//                   ),
//                   (route) => false);
//             },
//             icon: const Icon(
//               Icons.arrow_circle_left_outlined,
//               color: Colors.white,
//               size: 35,
//             ),
//           ),
//           title: const Text(
//             "Add New Entry",
//             style: TextStyle(
//                 fontSize: 30,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 2),
//           ),
//           // backgroundColor: Colors.transparent,
//         ),