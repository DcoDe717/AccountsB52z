// ignore_for_file: avoid_print


import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenHomePieChartView extends StatefulWidget {
  const ScreenHomePieChartView({super.key});

  @override
  State<ScreenHomePieChartView> createState() => _ScreenHomePieChartViewState();
}

class _ScreenHomePieChartViewState extends State<ScreenHomePieChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //           colors: [Color.fromARGB(202, 237, 123, 132), Color.fromARGB(195, 144, 85, 255)])
          ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [pieLogoImageBox(), balanceFundBox()],
              ),
              Row(
                children: [totalFundReceivedBox(), totalFundExpectedBox()],
              ),
              // Row(
              //   children: [testPressMeButtonBox()],
              // ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget pieLogoImageBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          // semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          // child: Image.asset("assets/img/logo1.png",
          //     fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget balanceFundBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromARGB(181, 33, 149, 243),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Balance Fund',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 25),
                Text(
                  "₹ $balanceFundTotalPulledFromDB",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget totalFundReceivedBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: Colors.lightGreen,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          child:  Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Total Fund\nReceived',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 25),
                Text(
                  "₹ $totalFundRecievedPulledFromDB",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget totalFundExpectedBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: Colors.redAccent,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          child:  Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Total Fund\nExpected',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 25),
                Text(
                  "₹ $totalFundExpectedCalculatedLocal",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget testPressMeButtonBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromARGB(255, 195, 74, 185),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {
                  // updatePendingMonthsAndCountWhole();
                  // dataLoopAddDbEntryMemberWise();
                  // calculateAndCreateTotalDocument();
                  // updatePendingMonthsAndAmountMemberWiseLoan('ismail');
                  // calculateTotalPendingLoanAmount();
                  //  totPendingCountMemberWiseListLoan(membersListLocal);

                  // print('user is $userNameGlobal');
                  // print('user admin status: $loggedUserAdminCheck');
                },
                child: const Text(
                  'Press me',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )),
          ),
        ),
      ),
    );
  }
}
