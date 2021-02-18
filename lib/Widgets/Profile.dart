import 'package:bank/model/Transaction.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final Transaction tx;
  Profile(this.tx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Card(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListTile(
              title: Text(
                tx.name,
                style: TextStyle(fontSize: 30),
              ),
              trailing: CircleAvatar(
                child: Image.asset("asset/images/user.png"),
              ),
              subtitle: Text(
                tx.upi,
                style: TextStyle(fontSize: 20),
              ),
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/profile.jpeg'),
                  fit: BoxFit.fill,
                ),
              )),
        ],
      ),
    );
  }
}
