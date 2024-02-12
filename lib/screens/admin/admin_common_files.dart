import 'package:flutter/material.dart';

String? selectedDropdownValueAdmin;
String chosenMemberAddEntryDropdown = '';
String commentsAddData = '';

// Variables to check the Loan approval process is success or not, for updating remaining fields
bool loanApprovalProcessTrueCheck = false;

String loanAmountTextFromTextController = '';
String commentsTextFromTextControllerLoanApproveScreen = '';
double? loanAmountParsed;

final loanAmountTextControllerLoanApproveScreen = TextEditingController();
final commentsTextControllerLoanApproveScreen = TextEditingController();

final loginUsernameTextController = TextEditingController();
final loginPasswordTextController = TextEditingController();

// Variable to store months emi status as map objects index : months
Map<String, String> emiMonthsListIndexValued = {};

// String choosedMemberLoanApprove = '';

final List<String> dropDownListAdmin = <String>[
  'adil',
  'akku',
  'cheppu',
  'dillu',
  'ismail',
  'jasim',
  'rishin',
  'sabith',
  'shammas',
  'sherbi',
  'sulfi',
  'vahab'
];
