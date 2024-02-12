import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String gSelectedMember = '';
double amountModifierAddEntryPageLocal = 0;

// Globally Create a single instance of FirebaseFirestore
final FirebaseFirestore firestoreInstanceCall = FirebaseFirestore.instance;

// Variable for list of selected MOnthly Installments Months index value
List<int> numericValuesListMonthlyInst = [];
List<String> numericValuesListMonthlyInstString = [];

// Variable for list of selected Loan Installments Months index value
List<String> extractedIndexValueFromSelectedLoanMonths = [];

// Variable for drop down value displayed in Add New Entry Screen
String? selectedDropdownValueAddEntry;

// Create a navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
