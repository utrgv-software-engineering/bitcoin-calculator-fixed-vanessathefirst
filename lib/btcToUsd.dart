import 'package:bitcoin_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';

class btcToUsd extends StatefulWidget {
  btcToUsd({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _btcToUsd createState() => _btcToUsd();
}

class _btcToUsd extends State<btcToUsd> {
  TextEditingController btc = TextEditingController();
  bool _isNotEmpty = false;
  bool usdColor = false;
  bool usdColor2 = false;
  double result;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC TO USD"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: !usdColor
                  ? Text("", style: TextStyle(color: Colors.white))
                  : Text(
                      "USD price is $result",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      key: Key('result'),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 55),
              child: Focus(
                child: TextField(
                    key: Key('enter-btc-field'),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    controller: btc,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 20),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(
                              width: 2, color: Color.fromRGBO(76, 116, 139, 1)),
                        )),
                    onChanged: (text) {
                      if (text.isEmpty) {
                        setState(() {
                          _isNotEmpty = false;
                          usdColor = false;
                        });
                      }
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: !usdColor2
                  ? Text("", style: TextStyle(color: Colors.white))
                  : Text(
                      "Enter a Valid BTC amount",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      key: Key('warning'),
                    ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      minimumSize: Size(280, 40) // foreground
                      ),
                  onPressed: () {
                    result = double.tryParse(btc.text);

                    if (btc.text.isNotEmpty &&
                        btc.text != '0' &&
                        btc.text != ',' &&
                        btc.text != '.') {
                      setState(() {
                        usdColor = true;
                        result = CurrencyCalculations.btctousd(result);
                      });
                    } else if (btc.text.isEmpty ||
                        result == 0 ||
                        btc.text == ',' ||
                        btc.text == '.') {
                      setState(() {
                        usdColor2 = true;
                      });
                    }
                  },
                  child: Text(
                    'Convert',
                    style: new TextStyle(color: Colors.white),
                    key: Key('convert-button'),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      minimumSize: Size(280, 40) // foreground
                      ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (MyApp())));
                  },
                  child: Text(
                    'Done',
                    key: Key('done-button'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
