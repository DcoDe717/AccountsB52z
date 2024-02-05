import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenMembersPendingListView extends StatelessWidget {
  const ScreenMembersPendingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //           colors: [Color.fromARGB(202, 237, 123, 132), Color.fromARGB(195, 144, 85, 255)])
                ),
            child: listviewMembersUnsettled()));
  }

  Widget listviewMembersUnsettled() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        // final category = newList[index];
        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const CircleAvatar(
                // backgroundImage: AssetImage("assets/img/pic1.jpg"),
                ),
            title: Text(listviewMembersList[index]),
            subtitle:  Text('Total Unsettled : ₹ ${((pendingCountListMemberWiseMonthly[index]) * 500)+(pendingLoanAmountAllMembersPulledDB[index])} '),
            trailing: Text(
                'MI Unsettled : ₹ ${(pendingCountListMemberWiseMonthly[index]) * 500} \nLoan Unsettled : ₹ ${pendingLoanAmountAllMembersPulledDB[index]}'),

            //  IconButton(
            //   onPressed: () {
            //     // CategoryDB.instance.deleteCategory(category.id);
            //   },
            //   icon: const Icon(Icons.delete),
            // ),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
