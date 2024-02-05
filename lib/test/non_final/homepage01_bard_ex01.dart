import 'package:flutter/material.dart';

class PieHomePage extends StatefulWidget {
  const PieHomePage({Key? key}) : super(key: key);

  @override
  State<PieHomePage> createState() => _PieHomePageState();
}

class _PieHomePageState extends State<PieHomePage> {
  // Replace with your actual data sources
  double balanceFund = 12345.67;
  double totalFundReceived = 54321.00;
  double totalFundExpected = 98765.43;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color
      appBar: AppBar(
        title: const Text('Accounts Tracking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Your dummy logo or image widget
                Image.asset('assets/img/choose.png', width: 100.0),
                TextButton(
                  onPressed: () {
                    // Handle settings button tap
                  },
                  child: const Icon(Icons.settings),
                ),
              ],
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Balance Fund'), // Optionally customize label
                        const SizedBox(height: 10.0),
                        Text(
                          '\$$balanceFund', // Adjust font size, style
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total Received'), // Optionally customize label
                        const SizedBox(height: 10.0),
                        Text(
                          '\$$totalFundReceived', // Adjust font size, style
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total Expected'), // Optionally customize label
                        const SizedBox(height: 10.0),
                        Text(
                          '\$$totalFundExpected', // Adjust font size, style
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                // Consider adding more interactive elements, data displays,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
