// Global Variables ----------------
int pendingMonthsCountFromDb = 0;

String pendindMonthsFromDbRaw = '';

List<String> pendingMonthsListSplittedArray = [];

bool loggedUserAdminCheck = false;

String userNameGlobal = '';

bool isAdminFunctionExecuted = false;

double loanTotalPendingFundPulledDB = 0;

List<String> pendingMonthsNamesListConverted = [
  'Jan 2022',
  'Feb 2022',
  'March 2022',
  'April 2022',
  'May 2022'
];
List<String> pendingMonthlyMonthsNamesListConvertedForMultiSelect = [];
List<String> falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect = [];

// Selection of Monthly Installment Multiselect saved here
List<dynamic> gSelectedMonthsMonthlyInstallmentsMultiSelect = [];

// Selection of Loan Installment Multiselect saved here
List<dynamic> gSelectedMonthsLoanInstallmentsMultiSelect = [];

// variable to store the loan amount of a member for calculating total and emi
double loanAmountPulledFromDb = 0;
