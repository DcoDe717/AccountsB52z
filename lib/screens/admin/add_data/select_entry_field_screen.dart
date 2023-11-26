import 'package:accounts3/screens/global/global_files.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:accounts3/screens/admin/add_data/common_file.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
//----------------------------------------------------------------------------------------

// // Global Variables ----------------
// int pendingMonthsCountFromDb = 0;
// String pendindMonthsFromDbRaw = '';
// List<String> pendingMonthsListSplittedArray = [];
// List<String> pendingMonthsNamesListConverted = [];

// // Selection saved here
// List<MonthsClass?> selectedMonthsMonthlyInstallments = [];

// // Fuction to convert list to months class objects.
// List<MonthsClass> convertToMonthsObjects(List<String> monthNames) {
//   return monthNames
//       .map((monthName) => MonthsClass(monthName: monthName))
//       .toList();
// }

// // variable for Usage of list to months class objects :
// List<MonthsClass> classItemsMonthlyInstallment = [];

// // variable for list after converting to multiselect required format.

// final itemsMultiSelectMonthlyInstallments = classItemsMonthlyInstallment
//     .map((month02) => MultiSelectItem<MonthsClass?>(month02, month02.monthName))
//     .toList();

//   // variables for multiselect_dropdown_flutter
//   List<String> itemMonthlySelected = [];

// //Function for dbcall, listcreator etc
// FutureBuilder<DocumentSnapshot> buildFutureBuilder() {
//   return FutureBuilder<DocumentSnapshot>(
//     future: FirebaseFirestore.instance
//         .collection('monthly_installments')
//         .doc(gSelectedMember)
//         .get(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const CircularProgressIndicator();
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else if (!snapshot.hasData || !snapshot.data!.exists) {
//         return const Text('Document does not exist');
//       } else {
//         // Retrieve the "pending_months" field as a string
//         pendindMonthsFromDbRaw = snapshot.data!['pending_months'];
//         pendingMonthsCountFromDb = snapshot.data!['pending_months_count'];

//         print("Pending months from db Raw : $pendindMonthsFromDbRaw");
//         print("Pending months counts from db Raw: $pendingMonthsCountFromDb");

//         // Use the string value in your local variable
//         pendingMonthsListSplittedArray = pendindMonthsFromDbRaw.split(',');
//         print(
//             "Pending months from db Splitted: $pendingMonthsListSplittedArray");

//         // Create a new list with month names
//         pendingMonthsNamesListConverted = pendingMonthsListSplittedArray
//             .map((monthValue) => getMonthName(int.parse(monthValue)))
//             .toList();

//         print(pendingMonthsNamesListConverted);

//         // Usage of list to months class objects :
//         classItemsMonthlyInstallment =
//             convertToMonthsObjects(pendingMonthsNamesListConverted);
//       }

//       try {
//         // list.add(matchList);
//         return const SizedBox(
//           height: 1,
//         );
//       } catch (exc) {
//         // print(exc);
//         rethrow;
//       }
//     },
//   );
// }

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

// Real Class starting here
class ScreenSelectEntryFields extends StatefulWidget {
  const ScreenSelectEntryFields({super.key});

  @override
  State<ScreenSelectEntryFields> createState() =>
      _ScreenSelectEntryFieldsState();
}

class _ScreenSelectEntryFieldsState extends State<ScreenSelectEntryFields> {
  // List<String> pendindMonthsFromDB = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(202, 237, 123, 132),
        Color.fromARGB(195, 144, 85, 255)
      ])),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // buildFutureBuilder(),
              const SizedBox(height: 30),

              //----<multiselect>-------------------------------------

              //   MultiSelectDropdown.simpleList(
              //   list: pendingMonthsNamesListConverted,
              //   initiallySelected: itemMonthlySelected,
              //   onChange: (newList) {
              //     print(newList);
              //     // your logic
              //   },
              //   includeSearch: true,
              //   includeSelectAll: true,
              //   isLarge: true, // Modal size will be a little large
              //   // Give a definite width when rendering this widget in a row
              //   width: 150, // Must be a definite number
              //   boxDecoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),

              // MultiSelectChipField<MonthsClass?>(
              //   scrollBar: HorizontalScrollBar(isAlwaysShown: true),
              //   scroll: false,
              //   title: const Text("Select Monthly Installments"),
              //   items: itemsMultiSelectMonthlyInstallments,
              //   icon: const Icon(Icons.check),
              //   onTap: (values) {
              //     selectedMonthsMonthlyInstallments = values;
              //   },
              // ),

              //----</multiselect>-------------------------------------

              const SizedBox(height: 40),

              FilledButton.icon(
                  onPressed: () {
                    print(gSelectedMember);
                    print(
                        "Pending months from db Raw : $pendindMonthsFromDbRaw");
                    print(
                        "Pending months counts from db Raw: $pendingMonthsCountFromDb");
                    print(
                        "Pending months from db Splitted: $pendingMonthsListSplittedArray");
                    // Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.done),
                  label: const Text('Submit'))
            ],
          ),
        ),
      ),
    ));
  }

  Widget labelTitle(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.5,
        letterSpacing: 0.2,
      ),
    );
  }
}
