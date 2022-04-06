import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';

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
              padding: EdgeInsets.only(left: 20, right: 20, top: 155),
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

                    if (btc.text.isNotEmpty) {
                      setState(() {
                        usdColor = true;
                        result = CurrencyCalculations.btctousd(result);
                      });
                    }
                  },
                  child: Text(
                    'Convert',
                    style: new TextStyle(color: Colors.white),
                    key: Key('convert-button'),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
