// ignore_for_file: avoid_print

import 'dart:async';

import 'package:accountsb52z/screens/admin/add_data/functions/onpressed_functions_collection_entry_field_submit.dart';
import 'package:accountsb52z/screens/admin/add_data/functions/retrieve_emi_month_names.dart';
import 'package:accountsb52z/screens/admin/add_data/functions/state_clear_add_entry.dart';
import 'package:accountsb52z/screens/admin/add_data/multiselectscreen/common_variables_multiselect_screen.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/admin/functions/get_month_name.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class MultiSelectScreenAddEntry extends StatefulWidget {


  const MultiSelectScreenAddEntry({Key? key}) : super(key: key);

  @override
  State<MultiSelectScreenAddEntry> createState() => _MultiSelectScreenAddEntryState();
}

class _MultiSelectScreenAddEntryState extends State<MultiSelectScreenAddEntry> {



   @override
  void initState() {
    super.initState();
 
  }

  Future<DocumentSnapshot> getMonthlyInstallments() async {
    try {
      return await firestoreInstanceCall
          .collection('monthly_installment')
          .doc(gSelectedMember)
          .get();
    } catch (e) {
      // Handle errors appropriately (e.g., log, show error message)
      print('Error fetching monthly installments: $e');
      rethrow;
    }
  }

  Future<DocumentSnapshot> getLoanInstallments() async {
    try {
      return await firestoreInstanceCall
          .collection('loan_installment')
          .doc(gSelectedMember)
          .get();
    } catch (e) {
      print('Error fetching loan status: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: Future.wait([
        getMonthlyInstallments(),
        getLoanInstallments(),
      ]),
      builder: (context, snapshots) {
        // Clearing loan pending false list due to after isloanactive is changed it still have old values.
        loanPendingFalseList.clear();
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {

          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Error fetching data.',
                style:
                    TextStyle(decoration: TextDecoration.none, fontSize: 35)),
            const SizedBox(height: 35),
            const Text('Choose any member.',
                style:
                    TextStyle(decoration: TextDecoration.none, fontSize: 35)),
            const SizedBox(height: 35),
            const Text(
                'To continue, you need to choose someone from the group.',
                style:
                    TextStyle(decoration: TextDecoration.none, fontSize: 25)),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () {
                stateClearAddEnrtyScreen();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenHome(),
                    ),
                    (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change the button background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust border radius
                ),
              ),
              child: const Text(
                'Go Back !',
                style: TextStyle(
                  fontSize: 16.0, // Adjust the font size as needed
                  color: Colors.white, // Change the text color
                  fontWeight: FontWeight.bold, // Adjust the font weight
                ),
              ),
            )
          ]);
        } else {
          final monthlyInstallmentsDocSnapshot = snapshots.data![0];
          final loanInstallmentsDocSnapshot = snapshots.data![1];
          gSelectedMonthsMonthlyInstallmentsMultiSelect = [];
          gSelectedMonthsLoanInstallmentsMultiSelect = [];

          // Monthly Installments Functions Section
          if (!monthlyInstallmentsDocSnapshot.exists) {
            return const Center(
                child: Text('Monthly installments document does not exist'));
          } else {
            // Retrieve the data from the snapshot
            pendingMonthlyMonthsFromDbRaw =
                monthlyInstallmentsDocSnapshot['pending_months_monthly'];

            print(
                "Pending months from db Raw : $pendingMonthlyMonthsFromDbRaw");

            if (pendingMonthlyMonthsFromDbRaw.isNotEmpty) {
              // Use the string value in your local variable
              pendingMonthlyMonthsListSplittedArray =
                  pendingMonthlyMonthsFromDbRaw.split(',');

              print(
                  "Pending months from db Splitted: $pendingMonthlyMonthsListSplittedArray");

              // Create a new list with month names
              pendingMonthlyMonthsNamesListConvertedForMultiSelect =
                  pendingMonthlyMonthsListSplittedArray
                      .map((monthValue) => getMonthName(int.parse(monthValue)))
                      .toList();

              print(
                  "Pending months names list converted : $pendingMonthlyMonthsNamesListConvertedForMultiSelect");
            }
          }

          // Loan Installments Functions Section
          if (!loanInstallmentsDocSnapshot.exists) {
            return const Center(
                child: Text('Loan installment document does not exist'));
          } else {
            final isLoanActive = loanInstallmentsDocSnapshot['is_loan_active'];

            if (isLoanActive != true) {
              // The loan is not active, you can handle this case accordingly
              // return const Center(child: Text('Loan is not active'));
            } // If Loan is active continue code for retrieving pending months
            else {
              print('isloanactive value: $isLoanActive');
              Map<String, dynamic> loanPendingMonthsFalseListIndex =
                  loanInstallmentsDocSnapshot['months_status_emi'];

              // Clearing the old values stored before the list updation process.
              loanPendingFalseList = [];

              loanPendingMonthsFalseListIndex.forEach((key, value) {
                if (value is bool && value == false) {
                  // int parsedKey = int.tryParse(key) ?? 0;
                  // loanPendingFalseMapStoring[parsedKey] = false;
                  loanPendingFalseList.add(key);
                }
              });

              print('loanPendingFalseList : $loanPendingFalseList');
              // retrieveEmiMonthNames(loanPendingFalseList);
            }
          }

          // Return the Scaffold widget as the root widget
          return FutureBuilder(
              future: retrieveEmiMonthNamesLoan(loanPendingFalseList),
              builder: (context, snapshot) {
                // Check if the future is still executing
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // If still loading, display a loading indicator
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // If an error occurred, display an error message
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  gSelectedMonthsMonthlyInstallmentsMultiSelect = [];

                  // If the future has completed successfully, build your widgets
                  return Scaffold(
                    body: GestureDetector(
                      // onTap: _resetIdleTimer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MultiSelectDropdown.simpleList(
                            list:
                                pendingMonthlyMonthsNamesListConvertedForMultiSelect,
                            whenEmpty: 'Select Monthly Installments',
                            numberOfItemsLabelToShow: 3,
                            initiallySelected: List.empty(growable: true),
                            onChange: (newList) {
                              gSelectedMonthsMonthlyInstallmentsMultiSelect =
                                  newList;
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
                              color: Colors
                                  .deepPurple.shade100, // Change color as needed
                              border: Border.all(
                                color: Colors.deepPurpleAccent,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              // Add additional styling if needed
                              // For example, padding, margin, etc.
                            ),
                          ),
                          const SizedBox(height: 20),
                          MultiSelectDropdown.simpleList(
                            list:
                                falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect,
                            whenEmpty: 'Select Loan Installments',
                            numberOfItemsLabelToShow: 3,
                            initiallySelected: List.empty(growable: true),
                            onChange: (newList) {
                              gSelectedMonthsLoanInstallmentsMultiSelect =
                                  newList;
                              print(
                                  "gSelectedMonthsLoanInstallmentsMultiSelect : $gSelectedMonthsLoanInstallmentsMultiSelect");
                      
                              // your logic
                            },
                            includeSearch: true,
                            includeSelectAll: true,
                            isLarge: true,
                            width: 150,
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors
                                  .deepPurple.shade100, // Change color as needed
                              border: Border.all(
                                color: Colors.deepPurpleAccent,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              // Add additional styling if needed
                              // For example, padding, margin, etc.
                            ),
                          ),
                          const SizedBox(height: 40),
                          FilledButton.icon(
                              onPressed: () {
                                onpressedSelectEntryFieldSubmitFunctionsCollection();
                      
                                // Navigate using push to get the refreshed screen of Screen Add Data
                                Navigator.of(context).pop('done');
                              },
                              icon: const Icon(Icons.done),
                              label: const Text('Submit'))
                        ],
                      ),
                    ),
                  );
                }
              });
        }
      },
    );
  }
}
