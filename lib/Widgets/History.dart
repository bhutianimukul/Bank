import 'package:bank/model/PaidTransaction.dart';
import 'package:bank/model/Transaction.dart';
import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import 'Front.dart';

class History extends StatelessWidget {
  final List<PaidTransaction> list;
  final List<Transaction> list1;
  User userinfo;
  History(this.list1, this.userinfo, this.list);

  @override
  Widget build(BuildContext context) {
    list.reversed;
    return Scaffold(
        body: list.isEmpty == false
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Receiver:  "),
                            Text(
                              list[index].name,
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Date:  "),
                            Text(DateFormat.yMMMd().format(list[index].date),
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        trailing: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "-" + list[index].amount.toStringAsFixed(1),
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "No Transactions Yet",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/images/waiting.png'),
                              fit: BoxFit.fill,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  Front(list1, userinfo, list)));
                    },
                  )
                ],
              ));
  }
}
