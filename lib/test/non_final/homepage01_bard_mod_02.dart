// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Replace with your actual data sources
//   double balanceFund = 12345.67;
//   double totalFundReceived = 54321.00;
//   double totalFundExpected = 98765.43;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Customize background color
//       appBar: AppBar(
//         title: const Text('Accounts Tracking'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0), // Adjust padding as needed
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Your dummy logo or image widget
//                 Image.asset('assets/your_logo.png', width: 50.0),
//                 IconButton(
//                   onPressed: () {}, // Handle settings tap
//                   icon: const Icon(Icons.settings),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20.0), // Adjust spacing as needed
//             Stack(
//               alignment: AlignmentDirectional.center,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   elevation: 5.0,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: Container(
//                       color: Colors.teal, // Customizable primary color
//                       padding: const EdgeInsets.all(30.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Balance Fund', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
//                           const SizedBox(height: 10.0),
//                           Text('\$<span class="math-inline">balanceFund', style\: TextStyle\(fontSize\: 24\.0, fontWeight\: FontWeight\.w500, color\: Colors\.white\)\),
// \],
// \),
// \),
// \),
// \),
// Positioned\(
// top\: \-30\.0,
// child\: Image\.asset\('assets/money\_icon\.png', width\: 80\.0\),
// \),
// \],
// \),
// const SizedBox\(height\: 20\.0\), // Adjust spacing as needed
// <1\>Row\(
// mainAxisAlignment\: MainAxisAlignment\.spaceBetween,
// <2\>children\: \[
// Card\(
// shape\: RoundedRectangleBorder\(
// borderRadius\: BorderRadius\.circular\(10\.0\),</1\>
// \),
// elevation\: 3\.0,
// child\: Container\(
// color\: Colors\.greenAccent,</2\> // Customizable accent color
// padding\: const EdgeInsets\.all\(15\.0\),
// child\: Column\(
// crossAxisAlignment\: CrossAxisAlignment\.center,
// children\: \[
// Text\('Total Received', style\: TextStyle\(fontSize\: 16\.0, fontWeight\: FontWeight\.bold\)\),
// const SizedBox\(height\: 5\.0\),
// Text\('\\</span><span class="math-inline">totalFundReceived', style\: TextStyle\(fontSize\: 18\.0, fontWeight\: FontWeight\.w500\)\),
// \],
// \),
// \),
// \),
// const SizedBox\(width\: 20\.0\),
// Card\(
// shape\: RoundedRectangleBorder\(
// borderRadius\: BorderRadius\.circular\(10\.0\),
// \),
// elevation\: 3\.0,
// child\: Container\(
// color\: Colors\.orangeAccent, // Customizable accent color
// padding\: const EdgeInsets\.all\(15\.0\),
// child\: Column\(
// crossAxisAlignment\: CrossAxisAlignment\.center,
// children\: \[
// Text\('Total Expected', style\: TextStyle\(fontSize\: 16\.0, fontWeight\: FontWeight\.bold\)\),
// const SizedBox\(height\: 5\.0\),
// Text\('\\</span>$totalFundExpected', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
