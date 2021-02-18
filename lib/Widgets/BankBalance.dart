import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';

class BankBalance extends StatelessWidget {
  final User userinfo;
  BankBalance(this.userinfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            SizedBox(height: 30),
            ListTile(
              title: Text(
                "BANK BALANCE",
                style: TextStyle(fontSize: 30),
              ),
              trailing: FittedBox(
                child: Text(
                  userinfo.balance.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            userinfo.balance > 2000
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      elevation: 0,
                      child: Image.asset("asset/images/positive.jpg"),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      child: Image.asset("asset/images/negative.jpg"),
                    ),
                  ),
          ],
        ));
  }
}
