import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenUserPendingView extends StatefulWidget {
  const ScreenUserPendingView({Key? key}) : super(key: key);

  @override
  State<ScreenUserPendingView> createState() => _ScreenUserPendingViewState();
}

class _ScreenUserPendingViewState extends State<ScreenUserPendingView> {
  // Replace with your actual user data
  String userName = userNameGlobal.toUpperCase();
  String userDpPath =
      "assets/img/dp/$userNameGlobal.PNG"; // Placeholder, replace with your image
  // double monthlyEmidue = switchCaseRetrievedValueMonthly;
  // double loanEmidue = switchCaseRetrievedValueLoan;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Adjust padding as needed
        child: Column(
          children: [
            // Center user DP
            CircleAvatar(
              radius: 85.0, // Adjust radius as needed
              backgroundImage: AssetImage(userDpPath),
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            // User name
            Text(
              userName,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            // Cards with rounded corners and shadows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard(
                  color: Colors.blueAccent,
                  title: 'Monthly EMI Due',
                  amount: switchCaseRetrievedValueMonthly,
                ),

                const SizedBox(width: 20.0), // Adjust spacing as needed
                _buildCard(
                  color: Colors.orangeAccent,
                  title: 'Loan EMI Due',
                  amount: switchCaseRetrievedValueLoan,
                ),
              ],
            ),
            _buildCardDueAmount(totalSwitchCaseMonthlyPlusLoan)
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required Color color, required String title, required double amount}) {
    print(
        'switchCaseRetrievedValueMonthly inside page 02 : $switchCaseRetrievedValueMonthly');
    print(
        'switchCaseRetrievedValueLoan inside page 02 : $switchCaseRetrievedValueLoan');
    return Card(
      color: color,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0), // Adjust spacing as needed
            Text(
              '₹ $amount',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildCardDueAmount(double amount) {
    return Card(
      color: amount == 0 ? Colors.green : Colors.redAccent, // Customizable background color
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10.0), // Adjust padding as needed
        child: Column(
          children: [
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Expand to full width
              children: [
                // Expand title widget to available space
                Expanded(
                  child: Text(
                    'Reminder',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow
                        .ellipsis, // Handle text overflow gracefully
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Expand to full width
              children: [
                // Expand title widget to available space
                Expanded(
                  child: Text(
                    'Your outstanding due amount',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow
                        .ellipsis, // Handle text overflow gracefully
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Expand to full width
              children: [
                // Align amount text to the right
                Text(
                  '₹ $amount',
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
