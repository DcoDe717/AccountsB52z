import 'package:flutter/material.dart';

String? selectedDropdownValueAdmin;
var choosedMember = '';
String commentsMonthlyInstAddData = '';

int currentBalanceValue = 100000;

String loanAmountTextFromTextController = '';
String commentsTextFromTextControllerLoanApproveScreen = '';
int? loanAmountParsed;

final loanAmountTextControllerLoanApproveScreen = TextEditingController();
final commentsTextControllerLoanApproveScreen = TextEditingController();

// variable to store month name and year using conversion in DateTime object
String formattedDate = '';

// Create a list to store month strings
List<String> monthsList = [];

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
