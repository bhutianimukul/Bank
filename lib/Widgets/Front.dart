import 'package:bank/model/PaidTransaction.dart';
import 'package:bank/model/Transaction.dart';
import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';

import 'TransactionList.dart';
import 'UserData.dart';

class Front extends StatelessWidget {
  final List<Transaction> list;

  final User userinfo;
  List<PaidTransaction> historylist;
  Front(this.list, this.userinfo, this.historylist);

  void profile(context, userinfo) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return UserData(userinfo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Transfer"),
        backgroundColor: Colors.lightBlue[800],
        actions: [
          IconButton(
            icon: Icon(Icons.view_headline_outlined),
            onPressed: () {
              profile(context, userinfo);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionList(list, userinfo, this.historylist),
          ],
        ),
      ),
    );
  }
}
