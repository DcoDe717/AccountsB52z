import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Replace with your actual data sources
  double balanceFund = 12345.67;
  double totalFundReceived = 54321.00;
  double totalFundExpected = 98765.43;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customizable background color
      appBar: AppBar(
        title: const Text('Accounts Tracking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align cards left
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space evenly
              children: [
                Image.asset('assets/img/choose.png', width: 200.0), // Customize logo
                // IconButton(
                //   onPressed: () {}, // Handle settings tap
                //   icon: const Icon(Icons.settings),
                // ),
              ],
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            _buildCard(
              color: Colors.teal, // Customizable primary color
              title: 'Balance Fund',
              amount: balanceFund,
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            _buildCard(
              color: Colors.greenAccent, // Customizable accent color
              title: 'Total Received',
              amount: totalFundReceived,
            ),
            const SizedBox(height: 20.0), // Adjust spacing as needed
            _buildCard(
              color: Colors.orangeAccent, // Customizable accent color
              title: 'Total Expected',
              amount: totalFundExpected,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Color color, required String title, required double amount}) {
    return Card(
      color: color,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Text('\$$amount', style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
