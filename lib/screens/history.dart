import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gas_calculator/model.dart';
import 'package:gas_calculator/screens/datahelper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> myData = [];

  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);

    _refreshData();
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.all(0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context as BuildContext);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Text(
                            'History',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: myData.length,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('16 Aug 23'),
                          item(myData[index]['title'],
                              myData[index]['description']),
                          ElevatedButton(
                              onPressed: () {
                                deleteItem(myData[index]['id']);
                              },
                              child: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
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

Widget item(String a, String b) {
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
                '${a} | ${b}',
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
