import 'package:flutter/material.dart';

class btcToUsd extends StatefulWidget {
  btcToUsd({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _btcToUsd createState() => _btcToUsd();
}

class _btcToUsd extends State<btcToUsd> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Focus(
                child: TextField(
                  key: Key('enter-btc-field'),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 20),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                            width: 2, color: Color.fromRGBO(76, 116, 139, 1)),
                      )),
                ),
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
                  onPressed: () {},
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
