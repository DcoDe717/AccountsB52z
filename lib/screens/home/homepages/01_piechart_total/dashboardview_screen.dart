import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenHomeDashboard extends StatefulWidget {
  const ScreenHomeDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenHomeDashboard> createState() => _ScreenHomeDashboardState();
}

class _ScreenHomeDashboardState extends State<ScreenHomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align cards left
          children: [
            // const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/b52z_logo_01.jpg', width: 140.0),
              ],
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard(
                  color: const Color(0xFFf2f2f2), // Customizable primary color
                  title: 'Balance Fund', // Consider this alternative
                  amount: balanceFundTotalPulledFromDB,
                ),
                _buildCard(
                  color: const Color(0xFFf2f2f2), // Customizable accent color
                  title: 'Tot. Fund Recieved', // Alternative
                  amount: totalFundRecievedPulledFromDB,
                ),
                _buildCard(
                  color: const Color(0xFFf2f2f2), // Customizable accent color
                  title: 'Tot. Fund Expected', // Alternative
                  amount: totalFundExpectedCalculatedLocal,
                ),
                _buildCardDueAmount(totalSwitchCaseMonthlyPlusLoan),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required Color color, required String title, required double amount}) {
    return Card(
      color: color,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10.0), // Adjust padding as needed
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Expand to full width
          children: [
            // Expand title widget to available space
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                overflow:
                    TextOverflow.ellipsis, // Handle text overflow gracefully
              ),
            ),
            // Align amount text to the right
            Text(
              '₹ $amount',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDueAmount(double amount) {
    return Card(
      color: amount == 0
          ? Colors.green
          : Colors.redAccent, // Customizable background color
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
