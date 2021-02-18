import 'package:bank/model/PaidTransaction.dart';
import 'package:bank/model/Transaction.dart';
import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Send extends StatelessWidget {
  Transaction tx;
  User userinfo;
  final List<PaidTransaction> list;
  final amountController = TextEditingController();
  final upiController = TextEditingController();
  Send(this.tx, this.userinfo, this.list);
  @override
  Widget build(BuildContext context) {
    void Dialog(String s) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(s),
              actions: [
                RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }

    void ConfirmDialog(String s) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(s),
              actions: [
                RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName));
                    }),
              ],
            );
          });
    }

    void checkUpi() {
      upiController.clear();
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Enter Upi"),
              content: TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: upiController,
              ),
              actions: [
                RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      if (upiController.text != userinfo.pin) {
                        Navigator.pop(context);
                        Dialog("invalid Upi");
                      } else {
                        list.add(new PaidTransaction(
                            tx.name,
                            tx.upi,
                            double.parse(amountController.text),
                            DateTime.now()));
                        double paid = userinfo.balance -
                            double.parse(amountController.text);
                        userinfo.balance = paid;
                        ConfirmDialog("Transaction Completed");
                      }
                    }),
              ],
            );
          });
    }

    void authenticate() {
      if (double.parse(amountController.text) < 0) {
        Dialog("Enter Valid Amount");
      } else if (double.parse(amountController.text) > userinfo.balance)
        Dialog("Enter amount less than Bank Balance");
      else if (double.parse(amountController.text) > 50000) {
        Dialog("Transaction Limit Reached");
      } else {
        checkUpi();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: double.infinity,
              child: Card(
                child: Image.asset("asset/images/upiImage.png"),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Receiver's Name"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.lightBlue[800]),
                        labelText: tx.name,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Receiver's UPI"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.lightBlue[800]),
                          labelText: tx.upi,
                        )),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Amount            "),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.lightBlue[800]),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Flexible(
              fit: FlexFit.loose,
              child: RaisedButton(
                color: Colors.lightBlue[800],
                child: Text(
                  "Pay",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  return authenticate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
