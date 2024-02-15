// ignore_for_file: avoid_print

import 'package:accountsb52z/functions/utils/reset_timer_function.dart';
import 'package:accountsb52z/screens/admin/admin_common_files.dart';
import 'package:accountsb52z/screens/admin/functions/clear_state_loan_approval_screen.dart';
import 'package:accountsb52z/screens/admin/functions/loan_approval_process.dart';
import 'package:accountsb52z/screens/admin/loan_approve/popup_alerts/choose_member_for_loan_approval_popup.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ScreenLoanApprove extends StatefulWidget {
  const ScreenLoanApprove({super.key});

  @override
  State<ScreenLoanApprove> createState() => _ScreenLoanApproveState();
}

class _ScreenLoanApproveState extends State<ScreenLoanApprove> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print("back button is pressed");

        resetIdleTimer();

        stateClearLoanApprovalScreen();

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenHome(),
            ),
            (route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(0, 87, 184, 1.0)),
          ),
          leading: IconButton(
            onPressed: () {
              resetIdleTimer();

              stateClearLoanApprovalScreen();

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
              size: 30,
            ),
          ),
          title: const Text(
            "Create New Loan",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                      labelTitle(
                          "Current Balance  ₹ $balanceFundTotalPulledFromDB")
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
          color: const Color.fromRGBO(0, 87, 184, 0.7),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const <BoxShadow>[],
        ),
        child: DropdownButtonFormField(
          dropdownColor: const Color.fromRGBO(0, 87, 184, 1.0),
          icon: const Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Colors.white,
          ),
          isExpanded: true,
          decoration: const InputDecoration(
            fillColor: Color.fromARGB(255, 108, 224, 13),
            labelText: '',
            border: OutlineInputBorder(borderSide: BorderSide.none),
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
          items: dropDownListAdmin
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
              .toList(),
          onChanged: (selectedvalue) {
            resetIdleTimer();
            selectedDropdownValueAdmin = selectedvalue;
          },
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
        keyboardType: TextInputType.text,
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
        color: Colors.black,
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
          resetIdleTimer();

          if (selectedDropdownValueAdmin?.isEmpty ?? true) {
            selectAnyMemberPopupForLoanApproval(context);
            print('selecetedDropdownValue is $selectedDropdownValueAdmin');
          } else {
            loanApprovalProcess(selectedDropdownValueAdmin, context);
          }
        },
        icon: const Icon(Icons.check_circle),
        label: const Text('Approve'));
  }
}
