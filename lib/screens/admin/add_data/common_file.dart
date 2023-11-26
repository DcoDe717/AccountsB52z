// Global Variables ----------------
int pendingMonthsCountFromDb = 0;
String pendindMonthsFromDbRaw = '';
List<String> pendingMonthsListSplittedArray = [];
List<String> pendingMonthsNamesListConverted = [
  'Jan 2022',
  'Feb 2022',
  'March 2022',
  'April 2022',
  'May 2022'
];

// Function for index to monthnames convertion ------
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



// // variable for Usage of list to months class objects :
// List<MonthsClass> classItemsMonthlyInstallment = [];



// Selection saved here
// List<MonthsClass?> selectedMonthsMonthlyInstallments = [];



// // final variable for list after converting to multiselect required format.[used in multiselect funtion]
// var itemsMultiSelectMonthlyInstallments = classItemsMonthlyInstallment
//     .map((month02) => MultiSelectItem<MonthsClass?>(month02, month02.monthName))
//     .toList();




// // function to call and store the list used for multiselect widget.
// void generateItemsForMultiSelect() {
// itemsMultiSelectMonthlyInstallments = classItemsMonthlyInstallment
//       .map((month02) => MultiSelectItem<MonthsClass?>(month02, month02.monthName))
//       .toList();
// }




// Fuction to convert list to months class objects.
// List<MonthsClass> convertToMonthsObjects(List<String> monthNames) {
//   return monthNames
//       .map((monthName) => MonthsClass(monthName: monthName))
//       .toList();
// }


// Function for dbcall, listcreator etc
// FutureBuilder<DocumentSnapshot> dbBuilderPendingMonths() {
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

//         // // Create a new list with month names
//         // pendingMonthsNamesListConverted = pendingMonthsListSplittedArray
//         //     .map((monthValue) => getMonthName(int.parse(monthValue)))
//         //     .toList();

//         // print(pendingMonthsNamesListConverted);

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


