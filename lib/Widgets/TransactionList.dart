import 'package:bank/Widgets/Send.dart';
import 'package:bank/model/PaidTransaction.dart';
import 'package:bank/model/Transaction.dart';
import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  final User userinfo;
  List<PaidTransaction> historylist;
  TransactionList(this.list, this.userinfo, this.historylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
                onLongPress: (() {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Profile(list[index]);
                      });
                }),
                title: Text(list[index].name),
                subtitle: Text(list[index].upi),
                trailing: IconButton(
                  color: Colors.lightBlue[800],
                  icon: Icon(Icons.send),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                Send(list[index], userinfo, this.historylist)));
                  },
                )),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
