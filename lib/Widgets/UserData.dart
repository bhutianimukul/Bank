import 'package:bank/model/User.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final User userinfo;
  UserData(this.userinfo);
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
                userinfo.username,
                style: TextStyle(fontSize: 30),
              ),
              trailing: CircleAvatar(
                child: Image.asset("asset/images/user.png"),
              ),
              subtitle: Text(
                userinfo.upi,
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
                  image: AssetImage('asset/images/card.png'),
                  fit: BoxFit.fill,
                ),
              )),
        ],
      ),
    );
  }
}
