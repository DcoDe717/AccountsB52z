// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/admin_common_files.dart';
import 'package:accounts3/screens/admin/functions/loan_approval_process.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:accounts3/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ScreenLoanApprove extends StatefulWidget {
  const ScreenLoanApprove({super.key});

  @override
  State<ScreenLoanApprove> createState() => _ScreenLoanApproveState();
}

class _ScreenLoanApproveState extends State<ScreenLoanApprove> {
  // final heightdevice = MediaQuery.of().size.height;
  // final widthdevice = MediaQuery.of(context).size.width;

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   loanAmountTextControllerLoanApproveScreen.dispose();
  //   commentsTextControllerLoanApproveScreen.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        print("back button is pressed");
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(202, 237, 123, 132),
              Color.fromARGB(195, 144, 85, 255)
            ])),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHome(),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: const Text(
            "Add New Entry",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          // backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(202, 237, 123, 132),
            Color.fromARGB(195, 144, 85, 255)
          ])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  labelTitle('Member'),
                  const SizedBox(height: 15),
                  memberDropDown(),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      labelTitle("Loan Amount"),
                      SizedBox(width: MediaQuery.of(context).size.width / 10),
                      labelTitle("Current Balance  ₹ $balanceFundTotalPulledFromDB")
                    ],
                  ),
                  const SizedBox(height: 15),
                  amountEntry(),
                  const SizedBox(height: 30),
                  labelTitle('Enter Comments'),
                  const SizedBox(height: 15),
                  commentsEntry(),
                  const SizedBox(height: 30),
                  approveEntry()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget memberDropDown() {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(167, 237, 123, 132),
          // gradient: const LinearGradient(colors: [
          //   Colors.redAccent,
          //   Colors.blueAccent,
          //   Colors.purpleAccent
          //   //add more colors
          // ]),
          borderRadius: BorderRadius.circular(5),
          // boxShadow: const <BoxShadow>[
          //   BoxShadow(
          //       color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
          //       blurRadius: 5) //blur radius of shadow
          // ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            style: const TextStyle(color: Colors.white),
            dropdownColor: const Color(0xff252041),
            icon: const Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: Colors.white,
            ),
            isExpanded: true,
            decoration: const InputDecoration(
              fillColor: Color(0xff2a2e3d),
              // borderRadius: BorderRadius.circular(15),
              labelText: '',
              border: OutlineInputBorder(borderSide: BorderSide.none),
              //  OutlineInputBorder()

              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            ),
            hint: const Text(
              'Select Member',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            value: selectedDropdownValueAdmin,
            items:
                dropDownListAdmin.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
            onChanged: (selectedvalue) {
              selectedDropdownValueAdmin = selectedvalue;
            },
          ),
        ),
      ),
    );
  }

  Widget amountEntry() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xff2a2e3d),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: loanAmountTextControllerLoanApproveScreen,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            hintText: "Enter Amount",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15, right: 15, top: 5)
            // labelText: "Amount",
            ),
      ),
    );
  }

  Widget commentsEntry() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xff2a2e3d),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: commentsTextControllerLoanApproveScreen,
        maxLines: null,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            hintText: "Optional Entry",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5)),
      ),
    );
  }

  Widget labelTitle(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.5,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget approveEntry() {
    loanApprovalProcessTrueCheck = false;

    return ElevatedButton.icon(
        onPressed: () {
          print(
              'loanApprovalProcessTrueCheck before: $loanApprovalProcessTrueCheck');

          loanApprovalProcess(selectedDropdownValueAdmin, context);

          print(
              'loanApprovalProcessTrueCheck after: $loanApprovalProcessTrueCheck');

          // if (loanApprovalProcessTrueCheck) {
          //   approvedMonthAndEMIMonthsListCreator();
          //   updateApprovedMonthDateAndEmiList();
          // }

          // setState(() {
          //   selectedDropdownValueAdmin = null;
          //   loanAmountTextControllerLoanApproveScreen.clear();
          //   commentsTextControllerLoanApproveScreen.clear();
          // });

          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ScreenHome(),
          //     ),
          //     (route) => false);

          // Navigator.popUntil(context, (ScreenHome) => false);
        },
        icon: const Icon(Icons.check_circle),
        label: const Text('Approve'));
  }

  // Future<void> updateApprovedMonthDateAndEmiList() async {
  //   Map<String, bool> emiStatusInitializer = {
  //     '1': false,
  //     '2': false,
  //     '3': false,
  //     '4': false,
  //     '5': false,
  //     '6': false,
  //     '7': false,
  //     '8': false,
  //     '9': false,
  //     '10': false,
  //   };
  //   final DocumentReference
  //       documentReferenceInsideupdateApprovedMonthDateAndEmiList =
  //       firestoreInstanceCall
  //           .collection('loan_installments')
  //           .doc(selectedDropdownValueAdmin);

  //   await documentReferenceInsideupdateApprovedMonthDateAndEmiList.set(
  //     {
  //       'emi_months_status': emiStatusInitializer,
  //       'approved_month_timestamp': Timestamp.now(),
  //       'emi_months': emiMonthsListIndexValued
  //     },
  //     SetOptions(merge: true),
  //   );
  // }
}
