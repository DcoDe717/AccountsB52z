// ignore_for_file: avoid_print

import 'package:accountsb52z/functions/firestoreFunctions/update_fs_fields_for_loan_selected_months.dart';
import 'package:accountsb52z/functions/firestoreFunctions/update_fs_fields_from_selected_months_monthly.dart';
import 'package:accountsb52z/screens/admin/add_data/functions/state_clear_add_entry.dart';
import 'package:accountsb52z/screens/admin/add_data/multiselectscreen/multi_select_screen.dart';
import 'package:accountsb52z/screens/admin/add_data/popup_alerts/select_any_fields_add_entry_popup.dart';
import 'package:accountsb52z/screens/admin/add_data/popup_alerts/select_any_user_add_entry_popup.dart';
import 'package:accountsb52z/screens/admin/admin_common_files.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/home_screen.dart';
import 'package:accountsb52z/screens/login/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';

class ScreenAddData extends StatefulWidget {
  const ScreenAddData({super.key});

  @override
  State<ScreenAddData> createState() => _ScreenAddDataState();
}

class _ScreenAddDataState extends State<ScreenAddData> {
  final commentsTextControllerAddDataScreen = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize variables here
    chosenMemberAddEntryDropdown = '';
    gSelectedMonthsMonthlyInstallmentsMultiSelect.clear();
    gSelectedMonthsLoanInstallmentsMultiSelect.clear();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    commentsTextControllerAddDataScreen.dispose();
    super.dispose();
  }

  Future<void> goToMultiSelecScreenForAmountUpdate() async {
    final updatedValue = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MultiSelectScreenAddEntry()),
    );

    // Check if the value was updated on the second screen
    if (updatedValue == 'done') {
      print('if (updatedValue) : passed');
      setState(() {
        amountModifierAddEntryPageLocal = amountModifierAddEntryPageLocal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        //do your logic here
        // setStatusBarColor(statusBarColorPrimary,statusBarIconBrightness: Brightness.light);
        print("back button is pressed");
        // do your logic ends
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
              stateClearAddEnrtyScreen();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelTitle("Member"),
                      const SizedBox(height: 15),
                      memberDropDown(),
                      const SizedBox(height: 30),
                      labelTitle("Credit Amount"),
                      const SizedBox(height: 15),
                      amountEntry(),
                      const SizedBox(height: 30),
                      labelTitle("Credit Fields"),
                      const SizedBox(height: 15),
                      selectEntryFieldsWid(),
                      const SizedBox(height: 30),
                      labelTitle("Enter Comments"),
                      const SizedBox(height: 15),
                      commentsEntry(),
                      const SizedBox(height: 30),
                      addEntry()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addEntry() {
    return ElevatedButton.icon(
        onPressed: () async {
          commentsAddData = commentsTextControllerAddDataScreen.text;

          // Check for drowndown value selected or not
          if (chosenMemberAddEntryDropdown.isNotEmpty) {
            print('if (gSelectedMember.isNotEmpty) passed');

            // Check for any fields selected or not
            if (gSelectedMonthsMonthlyInstallmentsMultiSelect.isNotEmpty ||
                gSelectedMonthsLoanInstallmentsMultiSelect.isNotEmpty) {
              print(
                  'if (gSelectedMonthsMonthlyInstallmentsMultiSelect.isEmpty): passed');

              // If no loan months is selected updateLoanField wont run
              if (gSelectedMonthsMonthlyInstallmentsMultiSelect.isNotEmpty &&
                  gSelectedMonthsLoanInstallmentsMultiSelect.isNotEmpty) {
                print('both monthly and loan fields are selected');
                await updateFSFieldsFromSelectedMonthsMonthlyInstTest(
                    "monthly_installments",
                    gSelectedMember,
                    "ispaid",
                    numericValuesListMonthlyInstString,
                    commentsAddData);

                await updateFSFieldsForLoanSelectedMonths(
                    'loan_installments',
                    gSelectedMember,
                    'emi_months_status',
                    extractedIndexValueFromSelectedLoanMonths,
                    commentsAddData);
              } else {
                if (gSelectedMonthsMonthlyInstallmentsMultiSelect.isNotEmpty) {
                  print('only selected monthly fields');
                  await updateFSFieldsFromSelectedMonthsMonthlyInstTest(
                      "monthly_installments",
                      gSelectedMember,
                      "ispaid",
                      numericValuesListMonthlyInstString,
                      commentsAddData);
                } else {
                  print('only selected loan fields');
                  await updateFSFieldsForLoanSelectedMonths(
                      'loan_installments',
                      gSelectedMember,
                      'emi_months_status',
                      extractedIndexValueFromSelectedLoanMonths,
                      commentsAddData);
                }
              }

              print('gSelectedMember : $gSelectedMember');

              setState(() {
                stateClearAddEnrtyScreen();
              });

              // ignore: use_build_context_synchronously
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenSplash(),
                  ),
                  (route) => false);
            } else {
              print('executing selectAnyFieldAddEntryScreenPopup');
              // no fields selected for the user, popup alert executed
              selectAnyFieldAddEntryScreenPopup(context, gSelectedMember);
            }
          } else {
            print('executing noMemberSelectedAddEntryScreenPopup');
            // No Member selected in dropdown, popup alert executed
            noMemberSelectedAddEntryScreenPopup(context);
          }
        },
        icon: const Icon(Icons.add_sharp),
        label: const Text('Add Entry'));
  }

  Widget selectEntryFieldsWid() {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(106, 59, 66, 94),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
              onPressed: () {
                // Test functions Deploy

                gSelectedMember = chosenMemberAddEntryDropdown;

                goToMultiSelecScreenForAmountUpdate();

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             const MultiSelectScreenAddEntry()));
              },
              icon: const Icon(Icons.arrow_right),
              label: const Text('Select Entry Fields')),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 66, 94),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Selected Fields",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Color(0xff232323),
                        color: Colors.white)),
                const SizedBox(height: 10),
                const Text("Monthly Installments",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Color(0xff232323)
                        color: Colors.white)),
                const SizedBox(height: 10),
                Text(gSelectedMonthsMonthlyInstallmentsMultiSelect.join(", "),
                    style: const TextStyle(
                        fontSize: 15,
                        // backgroundColor: Color(0xff232323)
                        color: Colors.white)),
                const SizedBox(height: 20),
                const Text("Loan Installments",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Color(0xff232323)
                        color: Colors.white)),
                const SizedBox(height: 10),
                Text(gSelectedMonthsLoanInstallmentsMultiSelect.join(", "),
                    style: const TextStyle(
                        fontSize: 15,
                        // backgroundColor: Color(0xff232323)
                        color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget amountEntry() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        readOnly: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "₹ $amountModifierAddEntryPageLocal",
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
        controller: commentsTextControllerAddDataScreen,
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

  Widget creditTypeChipData(String label1, int color1) {
    return Chip(
      backgroundColor: Color(color1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
        label1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 3.8,
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
          borderRadius: BorderRadius.circular(5),
          boxShadow: const <BoxShadow>[],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            dropdownColor: Colors.deepPurple.shade50,
            icon: const Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: Colors.white,
            ),
            isExpanded: true,
            decoration: const InputDecoration(
              fillColor: Color(0xff2a2e3d),
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
            value: selectedDropdownValueAddEntry,
            items: dropDownListAdmin
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                )
                .toList(),
            onChanged: handleDropdownChange,
          ),
        ),
      ),
    );
  }

  void handleDropdownChange(String? selectedValue) {
    // Handle the selection here
    // amountModifier = 500;
    // Call your function here
    // e.g., _yourFunction(selectedvalue);
    chosenMemberAddEntryDropdown = selectedValue!;
    print("chosenMember: $chosenMemberAddEntryDropdown");

    setState(() {
      selectedDropdownValueAddEntry = selectedValue;
      amountModifierAddEntryPageLocal = 0;
      gSelectedMonthsMonthlyInstallmentsMultiSelect.clear();
      gSelectedMonthsLoanInstallmentsMultiSelect.clear();
      commentsTextControllerAddDataScreen.clear();
    });
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
}
