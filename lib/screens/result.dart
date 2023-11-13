import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gas_calculator/model.dart';
import 'package:gas_calculator/screens/datahelper.dart';
import 'package:gas_calculator/screens/history.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SecondRoute extends StatefulWidget {
  final int a;
  final int b;
  final double c;

  SecondRoute({
    Key? key,
    required this.a,
    required this.b,
    required this.c,
  }) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 1. Using Timer
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
// 2. Future.delayed
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9D03),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.

            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      //color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                    Container(
                      color: Color(0xffFF9D03),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(),
                              //color: Colors.white,
                              child: Text(
                                'VOLVO XC90 2008',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Image(image: AssetImage('assets/1.png')),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_isLoading == true) ...[
                            Center(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 193, 126, 20)),
                              ),
                            )
                          ] else ...[
                            information(widget.b, widget.a),
                            SizedBox(
                              height: 30,
                            ),
                            informationb(widget.b, widget.a, widget.c),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .amber, // Text Color (Foreground color)
                                    ),
                                    onPressed: () async {
                                      var galloes =
                                          ((widget.a - widget.b) / 14);
                                      var price = (galloes * widget.c);
                                      String a = galloes.toStringAsFixed(2);
                                      String b = price.toStringAsFixed(2);

                                      await DatabaseHelper.createItem(a, b);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HistoryScreen(),
                                          ));
                                    },
                                    child: Text(
                                      'Adicionar ao historico',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ],
                      ),
                    )
                  ],
                ),

                /*child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xff424141),
                                ),
                                height: 200,
                                width: 400,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                '${b}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Km: Inicial :',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '${a}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Km: final',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${b}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Km: Inicial :',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '${a}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Km: final',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget information(int km_inicial, int km_final) {
  final int subtracao = km_final - km_inicial;
  final double gallons = subtracao / 14;
  String auxa = gallons.toStringAsFixed(2);
  String aux = subtracao.toString();

  return Container(
    height: 140,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff424141),
    ),
    child: Column(
      children: [
        Container(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Row(
              children: [
                Container(
                  //color: Colors.green,
                  width: 120,
                  child: Column(children: [
                    Text(
                      '${km_inicial}',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFA326),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Km inicial',
                      style: TextStyle(
                        color: Color(0xffFFA326),
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: 120,
                  child: Column(children: [
                    Text(
                      '${km_final}',
                      style: GoogleFonts.montserrat(
                          color: Color(0xffFFA326),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Km final',
                      style: TextStyle(
                        color: Color(0xffFFA326),
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Container(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
            child: Row(
              children: [
                Container(
                  //color: Colors.green,
                  width: 120,
                  child: Column(children: [
                    Text(
                      '${subtracao}',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFA326),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Km rodados',
                      style: TextStyle(
                        color: Color(0xffFFA326),
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: 120,
                  child: Column(children: [
                    Text(
                      '${auxa}',
                      style: GoogleFonts.montserrat(
                          color: Color(0xffFFA326),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Gallons gastos',
                      style: TextStyle(
                        color: Color(0xffFFA326),
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget informationb(int a, int b, double per_gallon) {
  final int subtracao = b - a;
  final double gallons = subtracao / 14;
  String auxa = (gallons * per_gallon).toStringAsFixed(2);
  String aux = subtracao.toString();
  return Container(
    height: 80,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xffFF9D03),
    ),
    child: Column(
      children: [
        Container(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              children: [
                Container(
                  //color: Colors.green,
                  width: 120,
                  child: Column(children: [
                    Text(
                      '' + '${auxa}',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Valor total',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
