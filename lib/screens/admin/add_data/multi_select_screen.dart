import 'package:accounts3/screens/global/global_files.dart';
import 'package:accounts3/screens/admin/add_data/add_data_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

// Global Variables ----------------
int pendingMonthsCountFromDb = 0;
String pendindMonthsFromDbRaw = '';
List<String> pendingMonthsListSplittedArray = [];
List<String> pendingMonthsNamesListConverted = [];

// Test variables
List<dynamic> monthsNameDemo = [
  "Jan 2022",
  "Feb 2022",
  "March 2022",
  "April 2022",
  "May 2022",
  "June 2022",
  "July 2022",
  "Aug 2022",
  "Sept 2022",
  "Oct 2022",
  "Nov 2022",
  "Dec 2022",
  "Jan 2023",
  "Feb 2023",
  "March 2023"
];

String getMonthName(int monthValue) {
  // List of month names
  List<String> monthNamesConverted = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  int year = 2022 + (monthValue - 1) ~/ 12;
  int monthIndex = (monthValue - 1) % 12;

  return '${monthNamesConverted[monthIndex]} $year';
}

class MultiSelectScreen extends StatelessWidget {
  const MultiSelectScreen({super.key});

  // Your other widget code...

  Future<DocumentSnapshot> getMonthlyInstallments() async {
    try {
      return await FirebaseFirestore.instance
          .collection('monthly_installments')
          .doc(gSelectedMember)
          .get();
    } catch (e) {
      // Handle errors appropriately (e.g., log, show error message)
      print('Error fetching monthly installments: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getMonthlyInstallments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Document does not exist'));
        } else {
          // Retrieve the data from the snapshot
          pendindMonthsFromDbRaw = snapshot.data!['pending_months'];
          pendingMonthsCountFromDb = snapshot.data!['pending_months_count'];

          print("Pending months from db Raw : $pendindMonthsFromDbRaw");
          print("Pending months counts from db Raw: $pendingMonthsCountFromDb");

          // Use the string value in your local variable
          pendingMonthsListSplittedArray = pendindMonthsFromDbRaw.split(',');
          print(
              "Pending months from db Splitted: $pendingMonthsListSplittedArray");

          // Create a new list with month names
          pendingMonthsNamesListConverted = pendingMonthsListSplittedArray
              .map((monthValue) => getMonthName(int.parse(monthValue)))
              .toList();

          print(
              "Pending months names list converted : $pendingMonthsNamesListConverted");

          // Return the Scaffold widget as the root widget
          return Scaffold(
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MultiSelectDropdown.simpleList(
                  list: pendingMonthsNamesListConverted,
                  initiallySelected: List.empty(growable: true),
                  onChange: (newList) {
                    gSelectedMonthsMonthlyInstallmentsMultiSelect = newList;
                    print(
                        "Multi select items : $gSelectedMonthsMonthlyInstallmentsMultiSelect");

                    // your logic
                  },
                  includeSearch: true,
                  includeSelectAll: true,
                  isLarge: true,
                  width: 150,
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // You can add more widgets here if needed

                const SizedBox(height: 40),
                FilledButton.icon(
                    onPressed: () {
                      // Calling amount modifier update function
                      updateAmountModifier();

                      // Calling Funtion to modify the amount in the Add New Entry Screen
                      updateSelectedDropdownValue();

                      // Calling funtion to create index number list from selected months list
                      numericValuesList = reverseMonthNameList(
                          gSelectedMonthsMonthlyInstallmentsMultiSelect);

                      //printing demo
                      print(
                          "gSelectedMonthsMonthlyInstallmentsMultiSelect :  $gSelectedMonthsMonthlyInstallmentsMultiSelect");

                      print("numericValuesList : $numericValuesList");

                      numericListStringConverter(numericValuesList);

                      print(
                          "numericValuesListString : $numericValuesListString");

                      // Navigate using push to get the refreshed screen of Screen Add Data
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenAddData(),
                          ),
                          (route) => false);
                    },
                    icon: const Icon(Icons.done),
                    label: const Text('Submit'))
              ],
            ),
          );
        }
      },
    );
  }
}
