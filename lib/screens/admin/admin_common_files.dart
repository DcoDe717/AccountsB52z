import 'package:flutter/material.dart';

String? selectedDropdownValueAdmin;
var chosenMember = '';
String commentsMonthlyInstAddData = '';

// Variables to check the Loan approval process is success or not, for updating remaining fields
bool loanApprovalProcessTrueCheck = false;

// int currentBalanceValue = 100000;

String loanAmountTextFromTextController = '';
String commentsTextFromTextControllerLoanApproveScreen = '';
int? loanAmountParsed;

final loanAmountTextControllerLoanApproveScreen = TextEditingController();
final commentsTextControllerLoanApproveScreen = TextEditingController();

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
