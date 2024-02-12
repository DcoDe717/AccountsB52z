import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:flutter/material.dart';

class ScreenMembersPendingListView extends StatelessWidget {
  const ScreenMembersPendingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(),
            child: listviewMembersUnsettled()));
  }

  Widget listviewMembersUnsettled() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        String listTileLoopUserName = indexToUserName(index);
        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/img/dp/$listTileLoopUserName.PNG"),
            ),
            title: Text(listviewMembersList[index]),
            subtitle: Text(
                'Total Unsettled : ₹ ${((pendingCountListMemberWiseMonthly[index]) * 500) + (pendingLoanAmountAllMembersPulledDB[index])} '),
            trailing: Text(
                'MI Unsettled : ₹ ${(pendingCountListMemberWiseMonthly[index]) * 500} \nLoan Unsettled : ₹ ${pendingLoanAmountAllMembersPulledDB[index]}'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 12,
    );
  }

  String indexToUserName(int a) {
    switch (a) {
      case 0:
        return 'adil';
      case 1:
        return 'akku';
      case 2:
        return 'cheppu';
      case 3:
        return 'dillu';
      case 4:
        return 'ismail';
      case 5:
        return 'jasim';
      case 6:
        return 'rishin';
      case 7:
        return 'sabith';
      case 8:
        return 'shammas';
      case 9:
        return 'sherbi';
      case 10:
        return 'sulfi';
      case 11:
        return 'vahab';
      default:
        return 'shammas';
    }
  }
}
