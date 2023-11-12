import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9D03),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.all(0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'History',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '16 Oct 23',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  item(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '02 Oct 23',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  item(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '31 Sep 23',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  item(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '24 Sep 23',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  item(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '01 Aug 23',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  item(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
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

Widget item() {
  return Container(
    height: 50,
    width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xff424141),
    ),
    child: Container(
      //color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                '3.5 Gallons | \$12,54',
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFA326),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
