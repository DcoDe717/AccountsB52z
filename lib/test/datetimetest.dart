// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TestDateTime extends StatefulWidget {
//   const TestDateTime({super.key});

//   @override
//   State<TestDateTime> createState() => _TestDateTimeState();
// }

// class _TestDateTimeState extends State<TestDateTime> {
//   String _currentTime = 'Loading...';
//   // String _currentTime2 = "2024-02-08T21:33:43.155248+05:30";

//   Future<void> _fetchTime() async {
//     try {
//       final response =
//           await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         final String currentTime = data['datetime'];
//         setState(() {
//           _currentTime = currentTime;
//         });
//       } else {
//         setState(() {
//           _currentTime = 'Failed to fetch time';
//         });
//       }
//     } catch (error) {
//       setState(() {
//         _currentTime = 'Error: $error';
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String yearMonth = _currentTime.substring(0, 7);
//     print('yearMonth : $yearMonth');
//     print('_currentTime : $_currentTime');
//     List<String> parts = _currentTime.split(' ');
//     print('parts : $parts');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Server Time'),
//       ),
//       body: Center(
//         child: Text(
//           'Server Time: ${parts[0]}',
//           style: const TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
