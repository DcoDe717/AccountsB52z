import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screens/global/global_variables.dart';

// Update true of the ispaid list in DB with the index value selected, and comments / Timestamp
Future<void> updateFSFieldsFromSelectedMonths(
    String collection,
    String document,
    String field,
    List<String> indexFinal,
    String commentsDown) async {
  final DocumentReference documentReference =
      firestoreInstanceCall.collection(collection).doc(document);

  // Loop through indexFinal list and update Firestore fields
  for (String index in indexFinal) {
    int? parsedIndex = int.tryParse(index);
    if (parsedIndex != null) {
      // Use update method to update specific field
      await documentReference.update({
        '$field.$parsedIndex': true,
        'comments.$parsedIndex': commentsDown,
        'dateTime.$parsedIndex': Timestamp.now(),
      });
      // await documentReference.update({
      //   'comments.$parsedIndex': commentsDown,
      // });

      // await documentReference.update({
      //   'dateTime.$parsedIndex': Timestamp.now(),
      // });
    }
  }
}
