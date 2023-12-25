// void main() {
//   List<String> dateStrings = [
// 'Apr 2021', 'Apr 2022', 'Apr 2023', 'Apr 2024', 'Apr 2025', 'Apr 2026',
// 'Aug 2021', 'Aug 2022', 'Aug 2023', 'Aug 2024', 'Aug 2025',
// 'Dec 2020', 'Dec 2021', 'Dec 2022', 'Dec 2023', 'Dec 2024', 'Dec 2025', 'Dec 2026',
// 'Feb 2020', 'Feb 2021', 'Feb 2022', 'Feb 2023', 'Feb 2024', 'Feb 2025', 'Feb 2026',
// 'Jan 2022', 'Jan 2023', 'Jan 2024', 'Jan 2025', 'Jan 2026',
// 'Jul 2020', 'Jul 2022', 'Jul 2023', 'Jul 2024', 'Jul 2025', 'Jul 2026',
// 'Jun 2020', 'Jun 2021', 'Jun 2023', 'Jun 2024', 'Jun 2025', 'Jun 2026',
// 'Mar 2020', 'Mar 2021', 'Mar 2023', 'Mar 2024', 'Mar 2025', 'Mar 2026',
// 'May 2020', 'May 2021', 'May 2022', 'May 2024', 'May 2025',
// 'Nov 2020', 'Nov 2021', 'Nov 2022', 'Nov 2023', 'Nov 2024', 'Nov 2025', 'Nov 2026',
// 'Oct 2020', 'Oct 2021', 'Oct 2022', 'Oct 2023', 'Oct 2024', 'Oct 2025', 'Oct 2026',
// 'Sep 2020', 'Sep 2021', 'Sep 2022', 'Sep 2023', 'Sep 2024', 'Sep 2025', 'Sep 2026'

//   ];

//   List<String> sortedDates = sortDatesChronologically(dateStrings);

//   print(sortedDates);
// }

// List<String> sortDatesChronologically(List<String> dateStrings) {
//   // Convert the date strings to DateTime objects
//   List<DateTime> dates = dateStrings.map((dateString) {
//     // Parse the month and year from the date string
//     var parts = dateString.split(' ');
//     var month = parts[0];
//     var year = int.tryParse(parts[1]); // Use int.tryParse to handle null values

//     // Map month names to corresponding numeric values
//     var monthMap = {
//       'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6,
//       'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12
//     };

//     // Create a DateTime object if year and month are non-null
//     return year != null && monthMap[month] != null
//         ? DateTime(year!, monthMap[month]!)
//         : DateTime.now(); // Provide a default value if year or month is null
//   }).toList();

//   // Sort the DateTime objects
//   dates.sort();

//   // Convert the sorted DateTime objects back to formatted date strings
//   List<String> sortedDateStrings = dates.map((date) {
//     var month = date.month;
//     var year = date.year;
//     return '${monthToString(month)} $year';
//   }).toList();

//   return sortedDateStrings;
// }

// String monthToString(int month) {
//   // Map numeric month values to corresponding month names
//   var monthMap = {
//     1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun',
//     7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'
//   };

//   return monthMap[month] ?? '';
// }
