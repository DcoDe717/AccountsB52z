// // ignore_for_file: avoid_print

// import 'package:accounts3/screens/admin/common_variables_admin.dart';
// import 'package:accounts3/screens/global/global_variables.dart';
// import 'package:accounts3/screens/admin/add_data/add_data_screen.dart';
// import 'package:accounts3/screens/global/utils/common_converters.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

// // Global Variables ----------------
// int pendingMonthlyMonthsCountFromDb = 0;
// String pendingMonthlyMonthsFromDbRaw = '';
// List<String> pendingMonthlyMonthsListSplittedArray = [];
// List<String> pendingMonthlyMonthsNamesListConverted = [];

// // Test variables
// List<dynamic> monthsNameDemo = [
//   "Jan 2022",
//   "Feb 2022",
//   "March 2022",
//   "April 2022",
//   "May 2022",
//   "June 2022",
//   "July 2022",
//   "Aug 2022",
//   "Sept 2022",
//   "Oct 2022",
//   "Nov 2022",
//   "Dec 2022",
//   "Jan 2023",
//   "Feb 2023",
//   "March 2023"
// ];

// String getMonthName(int monthValue) {
//   // List of month names
//   List<String> monthNamesConverted = [
//     'Jan',
//     'Feb',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'Aug',
//     'Sept',
//     'Oct',
//     'Nov',
//     'Dec'
//   ];

//   int year = 2022 + (monthValue - 1) ~/ 12;
//   int monthIndex = (monthValue - 1) % 12;

//   return '${monthNamesConverted[monthIndex]} $year';
// }

// class MultiSelectScreen extends StatelessWidget {
//   const MultiSelectScreen({super.key});

//   // Your other widget code...

//   Future<DocumentSnapshot> getMonthlyInstallments() async {
//     try {
//       return await firestoreInstanceCall
//           .collection('monthly_installments')
//           .doc(gSelectedMember)
//           .get();
//     } catch (e) {
//       // Handle errors appropriately (e.g., log, show error message)
//       print('Error fetching monthly installments: $e');
//       rethrow;
//     }
//   }


//    Future<DocumentSnapshot> getLoanInstallments() async {
//     try {
//       return await firestoreInstanceCall
//           .collection('loan_installments')
//           .doc(gSelectedMember)
//           .get();
//     } catch (e) {
//       print('Error fetching loan installments: $e');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: getMonthlyInstallments(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || !snapshot.data!.exists) {
//           return const Center(child: Text('Document does not exist'));
//         } else {
//           // Retrieve the data from the snapshot
//           pendingMonthlyMonthsFromDbRaw = snapshot.data!['pending_months'];
//           pendingMonthlyMonthsCountFromDb = snapshot.data!['pending_months_count'];

//           print("Pending months from db Raw : $pendingMonthlyMonthsFromDbRaw");
//           print("Pending months counts from db Raw: $pendingMonthlyMonthsCountFromDb");

//           // Use the string value in your local variable
//           pendingMonthlyMonthsListSplittedArray = pendingMonthlyMonthsFromDbRaw.split(',');
//           print(
//               "Pending months from db Splitted: $pendingMonthlyMonthsListSplittedArray");

//           // Create a new list with month names
//           pendingMonthlyMonthsNamesListConverted = pendingMonthlyMonthsListSplittedArray
//               .map((monthValue) => getMonthName(int.parse(monthValue)))
//               .toList();

//           print(
//               "Pending months names list converted : $pendingMonthlyMonthsNamesListConverted");

//           // Return the Scaffold widget as the root widget
//           return Scaffold(
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 MultiSelectDropdown.simpleList(
//                   list: pendingMonthlyMonthsNamesListConverted,
//                   whenEmpty: 'Select Monthly Installments',
//                   numberOfItemsLabelToShow: 3,
//                   initiallySelected: List.empty(growable: true),
//                   onChange: (newList) {
//                     gSelectedMonthsMonthlyInstallmentsMultiSelect = newList;
//                     print(
//                         "Multi select items : $gSelectedMonthsMonthlyInstallmentsMultiSelect");

//                     // your logic
//                   },
//                   includeSearch: true,
//                   includeSelectAll: true,
//                   isLarge: true,
//                   width: 150,
//                   boxDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.deepPurple.shade100, // Change color as needed
//                     border: Border.all(
//                       color: Colors.deepPurpleAccent,
//                       width: 2.0,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                     // Add additional styling if needed
//                     // For example, padding, margin, etc.
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 MultiSelectDropdown.simpleList(
//                   list: pendingMonthlyMonthsNamesListConverted,
//                   initiallySelected: List.empty(growable: true),
//                   onChange: (newList) {
//                     gSelectedMonthsMonthlyInstallmentsMultiSelect = newList;
//                     print(
//                         "Multi select items : $gSelectedMonthsMonthlyInstallmentsMultiSelect");

//                     // your logic
//                   },
//                   includeSearch: true,
//                   includeSelectAll: true,
//                   isLarge: true,
//                   width: 150,
//                   boxDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.deepPurple.shade100, // Change color as needed
//                     border: Border.all(
//                       color: Colors.deepPurpleAccent,
//                       width: 2.0,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                     // Add additional styling if needed
//                     // For example, padding, margin, etc.
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 FilledButton.icon(
//                     onPressed: () {
//                       // Calling amount modifier update function
//                       updateAmountModifier();

//                       // Calling Funtion to modify the amount in the Add New Entry Screen
//                       updateSelectedDropdownValue();

//                       // Calling funtion to create index number list from selected months list
//                       numericValuesList = reverseMonthNameList(
//                           gSelectedMonthsMonthlyInstallmentsMultiSelect);

//                       //printing demo
//                       print(
//                           "gSelectedMonthsMonthlyInstallmentsMultiSelect :  $gSelectedMonthsMonthlyInstallmentsMultiSelect");

//                       print("numericValuesList : $numericValuesList");

//                       numericListStringConverter(numericValuesList);

//                       print(
//                           "numericValuesListString : $numericValuesListString");

//                       // Navigate using push to get the refreshed screen of Screen Add Data
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const ScreenAddData(),
//                           ),
//                           (route) => false);
//                     },
//                     icon: const Icon(Icons.done),
//                     label: const Text('Submit'))
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }
