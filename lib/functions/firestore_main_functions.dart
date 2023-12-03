import 'package:accounts3/screens/global/global_files.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Funtion to update the TotalTrueCount
Future<void> calculateAndCreateTotalDocument() async {
  final db3 = FirebaseFirestore.instance.collection('monthly_installments');

  // Fetch all documents from the "monthly_installments" collection
  QuerySnapshot monthlyInstallments = await db3.get();

  // Calculate the total number of ispaid fields with value true
  int totalTrueCount = 0;

  for (var doc in monthlyInstallments.docs) {
    // Explicitly cast doc.data() to Map<String, dynamic>
    // Casting to Map: doc.data() is used to get the data of the current document.
    // Since the exact type is not known, it is explicitly cast to Map<String, dynamic> using as Map<String, dynamic>.
    // This allows Dart to recognize and work with the map structure.
    final dataMap = doc.data() as Map<String, dynamic>;

    // Check if 'ispaid' field exists and is a map
    // It checks if the 'ispaid' field exists in the document's data (dataMap) and if it is of type Map<dynamic, dynamic>.
    // If these conditions are met, it proceeds to the next step.
    // Casting 'ispaid' to Map: If the 'ispaid' field is a map,
    // it is explicitly cast to Map<dynamic, dynamic> using as Map<dynamic, dynamic>.
    if (dataMap.containsKey('ispaid') &&
        dataMap['ispaid'] is Map<dynamic, dynamic>) {
      final ispaidMap = dataMap['ispaid'] as Map<dynamic, dynamic>;

      // Iterate through the map and count the true values
      ispaidMap.forEach((key, value) {
        if (value is bool && value) {
          totalTrueCount++;
        }
      });
    }
  }

  // Create a new document with the calculated total and timestamp if required
  await db3.doc('total_doc_values').set({
    'totalTrueCount': totalTrueCount,
    'balance_fund_from_true_count': (totalTrueCount*500),
    // 'timestamp': FieldValue.serverTimestamp(),
  });

  // await db3.doc('total_doc_values').set({
  //   'balance_fund_from_true_count': (totalTrueCount*500),
  //   // 'timestamp': FieldValue.serverTimestamp(),
  // });


}


//----------------------------------------------



// Funtion to update (ispaid = false) pending months and count in each member document
Future<void> updatePendingMonthsAndCount() async {
  final db = FirebaseFirestore.instance;
  final monthlyInstallmentsCollection = db.collection('monthly_installments');

  // Fetch all documents from the "monthly_installments" collection
  QuerySnapshot monthlyInstallments = await monthlyInstallmentsCollection.get();

  for (var doc in monthlyInstallments.docs) {
    // Explicitly cast doc.data() to Map<String, dynamic>
    final dataMap = doc.data() as Map<String, dynamic>;

    // Check if 'ispaid' field exists and is a map
    if (dataMap.containsKey('ispaid') &&
        dataMap['ispaid'] is Map<dynamic, dynamic>) {
      // If 'ispaid' is a map, cast it to Map<dynamic, dynamic>
      final ispaidMap = dataMap['ispaid'] as Map<dynamic, dynamic>;

      // Iterate through the map and check the boolean values
      List<String> pendingMonths = [];
      ispaidMap.forEach((key, value) {
        if (value is bool && !value) {
          pendingMonths.add(key.toString());
        }
      });

      // Convert the list of index numbers to a comma-separated string
      String pendingMonthsString = pendingMonths.join(',');

      // Create or update the 'pending_months' field in the document
      await monthlyInstallmentsCollection.doc(doc.id).set(
          {'pending_months': pendingMonthsString}, SetOptions(merge: true));

      // Create or update the 'pending_months_count' field with the count of pending months
      await monthlyInstallmentsCollection.doc(doc.id).set(
          {'pending_months_count': pendingMonths.length},
          SetOptions(merge: true));
    }
  }
}






// Funtion to add complete data using loop (commentind down - open if required)

// Future<void> newFunc01() async {
//   int idx = 1;
//   var members = 'try1';

//   final dbcall2 = FirebaseFirestore.instance.collection('monthly_installments');
//   var document1 = <String, dynamic>{
//     // "comments": {'$idx': 'old book records'},
//     // "ispaid": {'$idx': true},
//     // "month": {'$idx': 'Jan 2022'},
//     // "date": {'$idx': Timestamp.now()}
//   };

//   // final document2 = <String, dynamic>{
//   //   "comments.$idx": 'paid=3000 | added=jasim | comment=phonpe23',
//   //   "ispaid.$idx": false,
//   //   "month.$idx": 'nov2023',
//   //   "date.$idx": Timestamp.now()
//   // };

//   // for (var i = 1; i < 2; i++) {
//   //   for (idx = 1; idx < 16; idx++) {

//   //    document1 = <String, dynamic>{
//   //   "comments": {'$idx': 'old book records'},
//   //   "ispaid": {'$idx': true},
//   //   "month": {'$idx': 'Jan 2022'},
//   //   "date": {'$idx': Timestamp.now()}
//   // };

//   //     await dbcall2.doc(members).set(document1, SetOptions(merge: true));

//   //   }
//   // }

//   //----------------------------------------------------------------------

//   String getMonthAbbreviation(int month) {
//     // Return the three-letter abbreviation for the month
//     switch (month) {
//       case 1:
//         return 'Jan';
//       case 2:
//         return 'Feb';
//       case 3:
//         return 'Mar';
//       case 4:
//         return 'Apr';
//       case 5:
//         return 'May';
//       case 6:
//         return 'June';
//       case 7:
//         return 'July';
//       case 8:
//         return 'Aug';
//       case 9:
//         return 'Sep';
//       case 10:
//         return 'Oct';
//       case 11:
//         return 'Nov';
//       case 12:
//         return 'Dec';
//       // Add more cases for the remaining months
//       // ...

//       default:
//         return '';
//     }
//   }

//   String getFormattedMonth(int idx) {
//     // Calculate the year and month based on the idx value
//     int year = 2022 + ((idx - 1) ~/ 12); // 12 months per year
//     int month = ((idx - 1) % 12) + 1; // Months are 1-based

//     // Format the month and year as 'Jan 2022', 'Feb 2022', etc.
//     return '${getMonthAbbreviation(month)} $year';
//   }

//   for (var i = 1; i < 2; i++) {
//     for (idx = 1; idx < 4; idx++) {
//       document1 = <String, dynamic>{
//         "comments": {'$idx': 'old book records'},
//         "ispaid": {'$idx': true},
//         "month": {'$idx': getFormattedMonth(idx)},
//         "date": {'$idx': Timestamp.now()}
//       };

//       // Now you can use document1 to update Firestore
//       await dbcall2.doc('$members').set(document1, SetOptions(merge: true));
//     }
//   }

//   //----------------------------------------------------------------------

// // await dbcall2.doc('$members').set(document1, SetOptions(merge: true));
//   // await dbcall2.doc('akku').set(document1, SetOptions(merge: true));
//   // await dbcall2.doc('akku').update(document1);
// }



// Funtion to update (ispaid = false) pending months and count in each member document
// Future<void> updatePendingMonthsAndCount23() async {
//   final db = FirebaseFirestore.instance;
//   final monthlyInstallmentsCollection = db.collection('monthly_installments');

//   // Fetch all documents from the "monthly_installments" collection
//   QuerySnapshot monthlyInstallments = await monthlyInstallmentsCollection.get();

//   for (var doc in monthlyInstallments.docs) {
//     // Explicitly cast doc.data() to Map<String, dynamic>
//     final dataMap = doc.data() as Map<String, dynamic>;

//     // Check if 'ispaid' field exists and is a map
//     if (dataMap.containsKey('ispaid') &&
//         dataMap['ispaid'] is Map<dynamic, dynamic>) {
//       // If 'ispaid' is a map, cast it to Map<dynamic, dynamic>
//       final ispaidMap = dataMap['ispaid'] as Map<dynamic, dynamic>;

//       // Iterate through the map and check the boolean values
//       List<String> pendingMonths = [];
//       ispaidMap.forEach((key, value) {
//         if (value is bool && !value) {
//           pendingMonths.add(key.toString());
//         }
//       });

//       // Convert the list of index numbers to a comma-separated string
//       String pendingMonthsString = pendingMonths.join(',');

//       // Create or update the 'pending_months' field in the document
//       await monthlyInstallmentsCollection.doc(doc.id).set(
//           {'pending_months': pendingMonthsString}, SetOptions(merge: true));

//       // Create or update the 'pending_months_count' field with the count of pending months
//       await monthlyInstallmentsCollection.doc(doc.id).set(
//           {'pending_months_count': pendingMonths.length},
//           SetOptions(merge: true));
//     }
//   }
// }



Future<void> updatePendingMonthsAndCountMemberWise() async {
  final db = FirebaseFirestore.instance;
  final String documentId = gSelectedMember; // Specify the document ID

  // Get a reference to the specific document
  final DocumentReference monthlyInstallmentsDocument =
      db.collection('monthly_installments').doc(documentId);

  try {
    // Fetch the specific document
    DocumentSnapshot monthlyInstallmentsSnapshot =
        await monthlyInstallmentsDocument.get();

    if (monthlyInstallmentsSnapshot.exists) {
      // Explicitly cast snapshot.data() to Map<String, dynamic>
      final dataMap =
          monthlyInstallmentsSnapshot.data() as Map<String, dynamic>;

      // Check if 'ispaid' field exists and is a map
      if (dataMap.containsKey('ispaid') &&
          dataMap['ispaid'] is Map<dynamic, dynamic>) {
        // If 'ispaid' is a map, cast it to Map<dynamic, dynamic>
        final ispaidMap = dataMap['ispaid'] as Map<dynamic, dynamic>;

        // Iterate through the map and check the boolean values
        List<String> pendingMonths = [];
        ispaidMap.forEach((key, value) {
          if (value is bool && !value) {
            pendingMonths.add(key.toString());
          }
        });

        // Convert the list of index numbers to a comma-separated string
        String pendingMonthsString = pendingMonths.join(',');

        // Create or update the 'pending_months' field in the document
        await monthlyInstallmentsDocument.set(
          {'pending_months': pendingMonthsString},
          SetOptions(merge: true),
        );

        // Create or update the 'pending_months_count' field with the count of pending months
        await monthlyInstallmentsDocument.set(
          {'pending_months_count': pendingMonths.length},
          SetOptions(merge: true),
        );
      }
    } else {
      // Document does not exist
      print('Document $documentId does not exist');
    }
  } catch (error) {
    // Handle errors
    print('Error getting document $documentId: $error');
  }
}


// Calling a Firestore instance
final FirebaseFirestore firestoreFun = FirebaseFirestore.instance;

// Update true of the ispaid list in DB with the index value selected
Future<void> updateFirestoreFields(String collection, String document, String field, List<String> indexFinal, String commentsDown) async {
  final DocumentReference documentReference = firestoreFun.collection(collection).doc(document);

  // Loop through indexFinal list and update Firestore fields
  for (String index in indexFinal) {
    int? parsedIndex = int.tryParse(index);
    if (parsedIndex != null) {
      // Use update method to update specific field
      await documentReference.update({
        '$field.$parsedIndex': true,
      });
      await documentReference.update({
        'comments.$parsedIndex': commentsDown,
      });

      await documentReference.update({
        'dateTime.$parsedIndex': Timestamp.now(),
      });
    }
  }
}