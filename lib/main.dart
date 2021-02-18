import 'package:bank/Widgets/BankBalance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';
import 'Widgets/Front.dart';
import 'Widgets/History.dart';
import 'model/PaidTransaction.dart';
import 'model/Transaction.dart';
import 'model/User.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bank",
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  User userinfo = User();
  final upiController = TextEditingController();
  List<PaidTransaction> historylist = [];
  List<Transaction> list = [
    new Transaction("1", "Jonathan", "TSMentJohny.@okaxis"),
    new Transaction("2", "Owais", "fnaticowais.@okaxis"),
    new Transaction("3", "Gill", "OrGill.@okaxis"),
    new Transaction("4", "Mortal", "SoulMortal.@okaxis"),
    new Transaction("5", "Scout", "ScoutOp.@okaxis"),
    new Transaction("6", "ClutchGod", "TSMentClutchGod.@okaxis"),
    new Transaction("7", "Mavi", "OrMavi.@okaxis"),
    new Transaction("8", "Aatanki", "CeltzAatanki.@okaxis"),
    new Transaction("9", "Ghatak", "TSMentGhatak.@okaxis"),
    new Transaction("10", "Snax", "IndSnax.@okaxis"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

    void sheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return BankBalance(userinfo);
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
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                        sheet();
                      }
                    }),
              ],
            );
          });
    }

    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('asset/images/banklogo.jpg')),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Hello ",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      userinfo.username,
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              
              SizedBox(
                height: 20,
              ),
              Container(
            child:FlipCard(
  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    height: 199,
                    margin: EdgeInsets.only(right: 10),
                    child: ListView(
                      padding: EdgeInsets.only(left: 16, right: 6),
                      children: [
                        Container(
                          height: 199,
                          width: 344,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/debitcard.png')),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Axis Bank",
                                      style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      userinfo.username,
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), back: Container(
                    height: 199,
                    margin: EdgeInsets.only(right: 10),
                    child: ListView(
                      padding: EdgeInsets.only(left: 16, right: 6),
                      children: [
                        Container(
                          height: 199,
                          width: 344,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/back.png')),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Axis Bank",
                                      style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          bottom: 13,
                          top: 29,
                        ),
                        child: Container(
                          child: Text(
                            "Operations",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Front(list, userinfo, historylist)));
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Container(
                                              height: 100,
                                              child: Image(
                                                image: AssetImage(
                                                    "asset/images/moneytransfer.png"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Send Money   ",
                                              style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 150,
                          width: 160,
                          //   color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              // checkUpi()==true? print("correct Upi"): print(" incorrect");
                              checkUpi();
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Container(
                                              height: 100,
                                              child: Image(
                                                image: AssetImage(
                                                    "asset/images/balance.png"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Bank Balance  ",
                                              style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) => History(
                                          list, userinfo, historylist)));
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Container(
                                              height: 100,
                                              child: Image(
                                                image: AssetImage(
                                                    "asset/images/history.jpg"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "History   ",
                                              style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      height: 100,
                      child: Image(
                        image: AssetImage('asset/images/banklogo.jpg'),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Go & Pay",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              )
            ],
          )),
    );
  }
}
