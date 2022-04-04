import 'package:bitcoin_calculator/btcToUsd.dart';
import 'package:flutter/material.dart';

import 'usdToBtc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Calculator',
      home: MyHomePage(title: 'Bitcoin Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => usdToBtc()),
                );
              },
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              color: Colors.red,
              child: Text(
                'USD TO BTC',
                style: new TextStyle(color: Colors.white),
                key: Key('usdToBtc'),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => btcToUsd()),
                );
              },
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              color: Colors.red,
              child: Text(
                'BTC TO USD',
                style: new TextStyle(color: Colors.white),
                key: Key('btcToUsd'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
