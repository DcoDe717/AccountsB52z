import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MonthsClass {
  final String monthName;

  MonthsClass({
    required this.monthName,
  });
}

List<String> pendingMonthsNamesListConverted = [
  'Oct 2022',
  'Nov 2022',
  'Dec 2022',
  'Jan 2023',
  'Feb 2023',
  'March 2023',
];

//selection saved here
List<MonthsClass?> selectedMonthsMonthlyInstallments = [];

//Fuction to convert list to months class objects.
List<MonthsClass> convertToMonthsObjects(List<String> monthNames) {
  return monthNames
      .map((monthName) => MonthsClass(monthName: monthName))
      .toList();
}

// Usage of list to months class objects:
List<MonthsClass> classItemsMonthlyInstallment =
    convertToMonthsObjects(pendingMonthsNamesListConverted);

//list after converting to multiselect required format.
final itemsMultiSelectMonthlyInstallments = classItemsMonthlyInstallment
    .map((month02) => MultiSelectItem<MonthsClass?>(month02, month02.monthName))
    .toList();

//Real class starting here
class YourApp extends StatefulWidget {
  @override
  _YourAppState createState() => _YourAppState();
}

class _YourAppState extends State<YourApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MultiSelectChipField Example'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              MultiSelectChipField<MonthsClass?>(
                scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                scroll: false,
                title: const Text("Select Loan Installments"),
                items: itemsMultiSelectMonthlyInstallments,
                icon: const Icon(Icons.check),
                onTap: (values) {
                  selectedMonthsMonthlyInstallments = values;
                },
              ),
              FilledButton.icon(
                  onPressed: () {
                    print(
                      itemsMultiSelectMonthlyInstallments,
                    );
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.done),
                  label: Text('Submit'))
            ]),

            // child: MultiSelectChipField(
            //   items: pendingMonthsNamesListConverted
            //       .map((month) => MultiSelectItem<String>(month, month))
            //       .toList(),

            //   // onTap: (selectedItems) {
            //   //   setState(() {
            //   //     selectedMonths = selectedItems;
            //   //   });
            //   // },

            //   itemBuilder: (item, state) {
            //     return Card(
            //       elevation: 1,
            //       child: ListTile(
            //         // title: Text(item),
            //         trailing: IconButton(
            //           icon: Icon(Icons.delete),
            //           onPressed: () {
            //             // state.deselect(item);
            //           },
            //         ),
            //       ),
            //     );
            //   },

            //   decoration: BoxDecoration(
            //     color: Colors.blue.withOpacity(0.1),
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //     border: Border.all(
            //       color: Colors.blue,
            //       width: 2,
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}


































































































// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreExample extends StatelessWidget {
//   const FirestoreExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Firestore Example'),
//         ),
//         body: FutureBuilder<DocumentSnapshot>(
//           future: FirebaseFirestore.instance.collection('monthly_installments').doc('dillu').get(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || !snapshot.data!.exists) {
//               return const Text('Document does not exist');
//             } else {
//               // Retrieve the "pending_months" field as a string
//               String pendingMonths = snapshot.data!['pending_months'];

//               // Use the string value in your local variable
//               List<String> pendingMonthsList = pendingMonths.split(',');

//               // Display the value or perform any other operations
//               return Column(
//                 children: [
//                   Text('Pending Months: $pendingMonths'),
//                   Text('Pending Months List: $pendingMonthsList'),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

// class Months {
//   final String monthName;

//   Months({
//     required this.monthName,
//   });
// }




// class YourApp extends StatefulWidget {
//   @override
//   _YourAppState createState() => _YourAppState();
// }

// class _YourAppState extends State<YourApp> {


//   static final List<Months> _monthsSelected = [
//     Months(monthName:"Oct 2022"),
//     Months(monthName:"Nov 2022"),
//     Months(monthName:"Dec 2022"),
//     Months(monthName:"Jan 2023"),
//     Months(monthName:"Feb 2023"),
//     Months(monthName:"March 2023"),
//   ];

//   final _items = _monthsSelected
//       .map((months2) => MultiSelectItem<Months?>(months2, months2.monthName))
//       .toList();

//   List<String> pendingMonthsNamesListConverted = [
//     'Oct 2022',
//     'Nov 2022',
//     'Dec 2022',
//     'Jan 2023',
//     'Feb 2023',
//     'March 2023',
//   ];

//   List<Months?> selectedMonths = [];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('MultiSelectChipField Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: MultiSelectChipField<Months?>(
               
//                 scrollBar: HorizontalScrollBar(isAlwaysShown: true),
//                 scroll: false,

//                 title: const Text("Select Loan Installments"),

//                 items: _items,
//                 icon: const Icon(Icons.check),
//                 onTap: (values) {
//                   selectedMonths = values;
//                 },
//               ),
//           // child: MultiSelectChipField(
//           //   items: pendingMonthsNamesListConverted
//           //       .map((month) => MultiSelectItem<String>(month, month))
//           //       .toList(),

//           //   // onTap: (selectedItems) {
//           //   //   setState(() {
//           //   //     selectedMonths = selectedItems;
//           //   //   });
//           //   // },

//           //   itemBuilder: (item, state) {
//           //     return Card(
//           //       elevation: 1,
//           //       child: ListTile(
//           //         // title: Text(item),
//           //         trailing: IconButton(
//           //           icon: Icon(Icons.delete),
//           //           onPressed: () {
//           //             // state.deselect(item);
//           //           },
//           //         ),
//           //       ),
//           //     );
//           //   },

//           //   decoration: BoxDecoration(
//           //     color: Colors.blue.withOpacity(0.1),
//           //     borderRadius: BorderRadius.all(Radius.circular(10)),
//           //     border: Border.all(
//           //       color: Colors.blue,
//           //       width: 2,
//           //     ),
//           //   ),
//           // ),
//         ),
//       ),
//     );
//   }
// }

















// import 'package:accounts3/global_files.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreExample extends StatelessWidget {
//   const FirestoreExample({super.key});

//   // Function to get month name from numeric value
//   // String getMonthName(int monthValue) {
//   //   // Map of month names
//   //   Map<int, String> monthNames = {
//   //     1: 'Jan 2022',
//   //     2: 'Feb 2022',
//   //     3: 'March 2022',
//   //     // Add more months as needed
//   //   };

//   //   // Return the corresponding month name or a default value
//   //   return monthNames[monthValue] ?? 'Unknown Month';
//   // }

//   String getMonthName(int monthValue) {
//     // List of month names
//     List<String> monthNames = [
//       'Jan', 'Feb', 'March', 'April', 'May', 'June',
//       'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
//     ];

//     int year = 2022 + (monthValue - 1) ~/ 12;
//     int monthIndex = (monthValue - 1) % 12;

//     return '${monthNames[monthIndex]} $year';
// }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Firestore Example'),
//         ),
//         body: FutureBuilder<DocumentSnapshot>(
//           future: FirebaseFirestore.instance.collection('monthly_installments').doc(gSelectedMember).get(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || !snapshot.data!.exists) {
//               return const Text('Document does not exist');
//             } else {
//               // Retrieve the "pending_months" field as a string
//               String? pendingMonths = snapshot.data!.get('pending_months');

//               if (pendingMonths != null) {
//                 // Use the string value in your local variable
//                 List<String> pendingMonthsList = pendingMonths.split(',');

//                 // Create a new list with month names
//                 List<String> monthNamesList = pendingMonthsList
//                     .map((monthValue) => getMonthName(int.parse(monthValue)))
//                     .toList();

//                 // Display the values or perform any other operations
//                 return Column(
//                   children: [
//                     Text('Pending Months: $pendingMonths'),
//                     Text('Month Names: $monthNamesList'),
//                   ],
//                 );
//               } else {
//                 return const Text('Pending Months field is null');
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }


















































