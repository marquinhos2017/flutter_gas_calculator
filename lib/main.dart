import 'package:flutter/material.dart';
import 'package:gas_calculator/screens/history.dart';
import 'package:gas_calculator/screens/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Calculador',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final km_final = TextEditingController();
  final km_inicial = TextEditingController();
  final price_per_gallon = TextEditingController();
  var aux = 1;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              // Information of Velhice

              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFF9D03),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50, right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                              backgroundColor: Color(0xffFF9D03),
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryScreen(),
                                ));
                          },
                          child: Text(
                            "History",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            //color: Colors.white,
                            child: Text(
                              'VOLVO XC90 2008',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('MPG: 16 miles'),
                          ),
                          Container(
                            child: Image(
                              width: 300,
                              image: AssetImage(
                                'assets/1.png',
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Container(
                  padding: EdgeInsets.only(top: 60),
                  child: Form(
                    child: Column(children: [
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          child: TextField(
                            controller: km_inicial,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(
                                  color: Color(0xffFF9D03),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff623D00)), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'KM inical',
                              hintStyle: TextStyle(color: Color(0xff6D4423)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          child: TextField(
                            controller: km_final,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(
                                  color: Color(0xffFF9D03),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff623D00)), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'KM final',
                              hintStyle: TextStyle(color: Color(0xff6D4423)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          child: TextField(
                            controller: price_per_gallon,
                            style: TextStyle(color: Colors.white),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(
                                  color: Color(0xffFF9D03),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff623D00)), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'How much per Gallon',
                              hintStyle: TextStyle(color: Color(0xff6D4423)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 7,
                        height: 70,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                                backgroundColor: Color(0xffFF9D03),
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (km_final.text.isEmpty ||
                                  km_inicial.text.isEmpty ||
                                  price_per_gallon.text.isEmpty) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: Color(0xffFF9D03),
                                    title: const Text('Erro'),
                                    content: const Text(
                                        'Insira as Informacoes requeridas'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondRoute(
                                            a: int.parse(km_final.text),
                                            b: int.parse(km_inicial.text),
                                            c: double.parse(
                                                price_per_gallon.text),
                                          )),
                                );
                              }
                            },
                            child: Text(
                              "CALCULAR",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
