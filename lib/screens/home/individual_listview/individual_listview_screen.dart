import 'package:flutter/material.dart';

class ScreenMembersPendingListView extends StatelessWidget {
  const ScreenMembersPendingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // decoration: BoxDecoration(
      // gradient: LinearGradient(
      //           colors: [Color.fromARGB(202, 237, 123, 132), Color.fromARGB(195, 144, 85, 255)])),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          // final category = newList[index];
          return const Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/img/pic1.jpg"),
              ),
              title: Text('Dillu'),
              subtitle: Text('Total Unsettled : ₹ 6500'),
              trailing: Text('MI Unsettled : ₹ 4500 \nLoan Unsettled : ₹ 2000'),

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
      ),
    ));
  }
}
