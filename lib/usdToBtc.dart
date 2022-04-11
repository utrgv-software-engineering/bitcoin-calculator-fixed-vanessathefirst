import 'package:bitcoin_calculator/config/globals.dart';
import 'package:bitcoin_calculator/main.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';

class usdToBtc extends StatefulWidget {
  usdToBtc({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _usdToBtc createState() => _usdToBtc();
}

class _usdToBtc extends State<usdToBtc> {
  TextEditingController usd = TextEditingController();
  double result;
  bool _isNotEmpty = false;
  bool btcColor = false;
  bool btcColor2 = false;

  Future<double> future;

  @override
  void initState() {
    super.initState();
    future = CurrencyCalculationsAPI.fetchCurrency(httpClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USD TO BTC"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: !btcColor
                  ? Text("", style: TextStyle(color: Colors.white))
                  : Text(
                      "BTC price is $result",
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
                  key: Key('enter-usd-field'),
                  textAlign: TextAlign.left,
                  controller: usd,
                  keyboardType: TextInputType.number,
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
                        btcColor = false;
                      });
                    }
                  },
                ),
                onFocusChange: (hadFocus) {
                  setState(() {
                    _isNotEmpty = hadFocus;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: !btcColor2
                  ? Text("", style: TextStyle(color: Colors.white))
                  : Text(
                      "Enter a Valid USD amount",
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
                      primary: _isNotEmpty
                          ? Colors.red
                          : Color.fromRGBO(226, 226, 226, 1), // background
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      minimumSize: Size(280, 40) // foreground
                      ),
                  onPressed: () {
                    result = double.tryParse(usd.text);

                    if (usd.text.isNotEmpty &&
                        usd.text != '0' &&
                        usd.text != ',' &&
                        usd.text != '.') {
                      setState(() {
                        btcColor = true;
                        result = CurrencyCalculationsAPIReal.usdtobtc(result);
                      });
                    } else if (usd.text.isEmpty ||
                        result == 0 ||
                        usd.text == ',' ||
                        usd.text == '.') {
                      setState(() {
                        btcColor2 = true;
                      });
                    }
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(color: Colors.white),
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
                )),
            Padding(padding: EdgeInsets.only(top: 10)),
            FutureBuilder<double>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Price: $value",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      key: Key('price'),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
//class _TextSubmitWidgetState extends State<_TextSubmitWidgetState> {}