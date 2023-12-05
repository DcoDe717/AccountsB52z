import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void timer022() {
  // Timestamp times = Timestamp.now();

// Replace this with your actual timestamp
  Timestamp times022 = Timestamp.now();

  // Convert Timestamp to DateTime
  DateTime dateTime = times022.toDate();

  // Get the current month name and year from the DateTime object
  String formattedDate = DateFormat('MMM y').format(dateTime);

  // Print the current month and year
  print('Current Month and Year: $formattedDate');

  // Add 2 months to the current DateTime
  // DateTime startDate =
  //     DateTime(dateTime.year, dateTime.month + 2, dateTime.day);

  // print(startDate);
  DateTime currentMonth;

  // Get the month name and year for the future date
  // String formattedFutureDate = DateFormat('MMM y').format(startDate);

  // Create a list to store month strings
  List<String> monthsList = [];

  // Generate a list of strings for the next 10 months
  for (int i = 0; i < 10; i++) {
     currentMonth =
        DateTime(dateTime.year, dateTime.month + 2 + i, dateTime.day);
    String formattedMonth = DateFormat('MMM y').format(currentMonth);
    monthsList.add(formattedMonth);
    // print(monthsList);
  }

  // Print the future month and year
  // print('Future Month and Year (+2 months): $formattedFutureDate');
}



































// // import 'package:cloud_firestore/cloud_firestore.dart';

// // Future<void> addEntryToLoanInstallemnt() async {
// //   final dbcall = FirebaseFirestore.instance.collection('loan_installments');

// //   var document1 = <String, dynamic>{
// //       "emi_status": {
// //         '1': true,
// //         '2': true,
// //         '3': true,
// //         '4': true,
// //         '5': false,
// //         '6': false,
// //         '7': false,
// //         '8': false,
// //         '9': false,
// //         '10': false
// //       },
// //     };

// //   // Fetch all documents from the "loan_installments" collection
// //   QuerySnapshot monthlyInstallments = await dbcall.get();

// //   for (var doc in monthlyInstallments.docs) {
// //     // Get the reference to the document
// //     DocumentReference docRef = dbcall.doc(doc.id);
    

// //     print(doc.id);

// //     await docRef.set(document1, SetOptions(merge: true));

// //     // Update the common field in the document
// //     // await docRef.update({
// //     //   'isloanactive':
// //     //       false, // Replace 'commonField' with the actual field you want to update
// //     // });

    
    
// //   }
// // }




