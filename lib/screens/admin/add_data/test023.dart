// // import 'package:accounts3/screens/admin/add_data/test012.dart';
// import 'package:accounts3/screens/admin/add_data/test012.dart';
// import 'package:flutter/material.dart';
// import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

// class MultiWidgetScreen extends StatefulWidget {
//   const MultiWidgetScreen({super.key});

//   @override
//   State<MultiWidgetScreen> createState() => _MultiWidgetScreenState();
// }

// class _MultiWidgetScreenState extends State<MultiWidgetScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         // Add the dropdown_search widget
//          MultiSelectDropdown.simpleList(
//                   list: pendingMonthsNamesListConverted,
//                   initiallySelected: selectedMonthsMonthlyInstallments,
//                   onChange: (newList) {
//                     print(newList);
//                     // your logic
//                   },
//                   includeSearch: true,
//                   includeSelectAll: true,
//                   isLarge: true, // Modal size will be a little large
//                   // Give a definite width when rendering this widget in a row
//                   width: 150, // Must be a definite number
//                   boxDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//       ],),
//     );
//   }
// }



  // Widget memberDropDown() {
  //   return SizedBox(
  //     height: 55,
  //     width: MediaQuery.of(context).size.width,
  //     child: DecoratedBox(
  //       decoration: BoxDecoration(
  //         color: const Color.fromARGB(167, 237, 123, 132),
  //         borderRadius: BorderRadius.circular(5),
  //         boxShadow: const <BoxShadow>[],
  //       ),
  //       child: DropdownButtonHideUnderline(
  //         child: DropdownButtonFormField(
  //           dropdownColor: Colors.deepPurple.shade50,
  //           icon: const Icon(
  //             Icons.arrow_drop_down_circle_outlined,
  //             color: Colors.white,
  //           ),
  //           isExpanded: true,
  //           decoration: const InputDecoration(
  //             fillColor: Color(0xff2a2e3d),
  //             labelText: '',
  //             border: OutlineInputBorder(borderSide: BorderSide.none),
  //             contentPadding:
  //                 EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
  //           ),
  //           hint: const Text(
  //             'Select Member',
  //             style: TextStyle(
  //               fontSize: 15,
  //               color: Colors.white,
  //               fontWeight: FontWeight.normal,
  //             ),
  //           ),
  //           value: selectedDropdownValue,
  //           items: dropdownList
  //               .map<DropdownMenuItem<String>>(
  //                 (String value) => DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(
  //                     value,
  //                     style: const TextStyle(fontSize: 23),
  //                   ),
  //                 ),
  //               )
  //               .toList(),
  //           onChanged: (selectedvalue) {
  //             choosedMember = selectedvalue!;
  //             setState(() {
  //               selectedDropdownValue = selectedvalue;
  //               amountModifier = 0;
  //               gSelectedMonthsMonthlyInstallmentsMultiSelect = [];
  //             });
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }