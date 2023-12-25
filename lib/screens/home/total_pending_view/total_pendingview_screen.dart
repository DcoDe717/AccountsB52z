// ignore_for_file: avoid_print

import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenTotPendingView extends StatefulWidget {
  const ScreenTotPendingView({super.key});

  @override
  State<ScreenTotPendingView> createState() => _ScreenTotPendingViewState();
}

class _ScreenTotPendingViewState extends State<ScreenTotPendingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(202, 237, 123, 132),
            Color.fromARGB(195, 144, 85, 255)
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),
                    selectMemberDropDown(),
                    const SizedBox(height: 50),
                    Row(
                      children: [monthlyPendingBox(), loanPendingBox()],
                    ),
                  ],
                ),
                recentBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectMemberDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        dropdownColor: Colors.deepPurple.shade50,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        isExpanded: true,
        decoration: const InputDecoration(
          labelText: 'Select Member',
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        ),
        // hint: const Text('Select '),
        value: selectedDropdownValueTotalPendingView,
        items: dropdownListHomePage.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
        onChanged: (selectedvalue) {
          switch (selectedvalue) {
            case 'Total':
              switchCaseRetrievedValue = totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;
              break;

            case 'Adil':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[0] * 500;
              break;
            case 'Akku':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[1] * 500;
              break;
            case 'Cheppu':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[2] * 500;
              break;
            case 'Dillu':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[3] * 500;
              break;
            case 'Ismail':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[4] * 500;
              break;
            case 'Jasim':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[5] * 500;
              break;
            case 'Rishin':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[6] * 500;
              break;
            case 'Sabith':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[7] * 500;
              break;
            case 'Shammas':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[8] * 500;
              break;
            case 'Sherbi':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[9] * 500;
              break;
            case 'Sulfi':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[10] * 500;
              break;
            case 'Vahab':
              switchCaseRetrievedValue = pendingCountListMemberWiseMonthly[11] * 500;
              break;
          }

          setState(() {
            selectedDropdownValueTotalPendingView = selectedvalue as String;
          });

          print('switchCaseRetrievedValue : $switchCaseRetrievedValue');
        },
      ),
    );
  }

  Widget monthlyPendingBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromARGB(255, 32, 111, 202),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Monthly Pending',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 25),
                Text(
                  "₹ $switchCaseRetrievedValue",
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

  Widget loanPendingBox() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromARGB(255, 32, 111, 202),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loan Pending',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 25),
                Text(
                  "₹ 11000",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recentBox() {
    final isMonthlyInst = true;
    final isLoanInst = false;
    return Container(
      // padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(106, 59, 66, 94),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 8),
            child: labelTitle("Recent Transactions"),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.21,
                    child: Card(
                      color: const Color.fromARGB(255, 185, 207, 59),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '₹ 3500 Paid: Jasim | Added: Sulfi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Visibility(
                                visible: isMonthlyInst,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: isMonthlyInst,
                              child: const Text(
                                'Monthly Installments : Jan2023, Feb2023, March2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            Visibility(
                                visible: isLoanInst,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: isLoanInst,
                              child: const Text(
                                'Loan Installments : Jan2023, Feb2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Comments : Gpay received",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.21,
                    child: Card(
                      color: const Color.fromARGB(255, 185, 207, 59),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '₹ 1000 Paid: Vahab | Added: Rishin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Visibility(
                                visible: isMonthlyInst,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: isMonthlyInst,
                              child: const Text(
                                'Monthly Installments : Jan2023, Feb2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            Visibility(
                                visible: isLoanInst,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: isLoanInst,
                              child: const Text(
                                'Loan Installments : Jan2023, Feb2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Comments : Gpay received",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget labelTitle(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w600,
        fontSize: 16.5,
        letterSpacing: 0.2,
      ),
    );
  }
}
