import 'package:cloud_firestore/cloud_firestore.dart';

var gSelectedMember = '';
int amountModifier = 0;

// Globally Create a single instance of FirebaseFirestore
final FirebaseFirestore firestoreInstanceCall = FirebaseFirestore.instance;

// Variable for list of selected MOnthly Installments Months index value
List<int> numericValuesList = [];
List<String> numericValuesListString = [];

// Variable for drop down value displayed in Add New Entry Screen
String? selectedDropdownValue;

// Selection of Monthly Installment Multiselect saved here
List<dynamic> gSelectedMonthsMonthlyInstallmentsMultiSelect = [];
