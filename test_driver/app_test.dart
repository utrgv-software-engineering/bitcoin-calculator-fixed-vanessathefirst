// Imports the Flutter Driver API.
import 'dart:math';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    test('testing usd to btc', () async {
      //first Screen
      final usdToBtc = find.byValueKey('usdToBtc');
      await driver.tap(usdToBtc);

      //second Screen
      final enterUsd = find.byValueKey('enter-usd-field');
      final convertBttn = find.byValueKey('convert-button');
      final result = find.byValueKey('result');
      await driver.tap(enterUsd);
      await driver.enterText('1');
      await driver.waitFor(find.text('1'));
      await driver.tap(convertBttn);
      final doneButton = find.byValueKey('done-button');
      expect(
          await driver.getText(result), 'BTC price is 0.00002287947322300851');
      await driver.tap(doneButton);
    });

    test('testing btc to usd', () async {
      // First, tap the button.
      final btcToUsd = find.byValueKey('btcToUsd');
      await driver.tap(btcToUsd);

      //second Screen
      final enterBtc = find.byValueKey('enter-btc-field');
      final convertBttn = find.byValueKey('convert-button');
      final result = find.byValueKey('result');
      await driver.tap(enterBtc);
      await driver.enterText('15');
      await driver.waitFor(find.text('15'));
      await driver.tap(convertBttn);
      final doneButton = find.byValueKey('done-button');
      expect(await driver.getText(result), 'USD price is 655609.5');
      await driver.tap(doneButton);
    });
  }, skip: true);

  group("Sad Paths", () {
    test('should give red message if input is empty usd to btc', () async {
      final usdToBtc = find.byValueKey('usdToBtc');
      await driver.tap(usdToBtc);

      //second Screen
      final enterUsd = find.byValueKey('enter-usd-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterUsd);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid USD amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is empty btctousd', () async {
      final btcToUsd = find.byValueKey('btcToUsd');
      await driver.tap(btcToUsd);

      //second Screen
      final enterBtc = find.byValueKey('enter-btc-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterBtc);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid BTC amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is 0 usdtobtc', () async {
      final usdToBtc = find.byValueKey('usdToBtc');
      await driver.tap(usdToBtc);

      //second Screen
      final enterUsd = find.byValueKey('enter-usd-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterUsd);
      await driver.enterText('0');
      await driver.waitFor(find.text('0'));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid USD amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is 0 btc to usd', () async {
      final btcToUsd = find.byValueKey('btcToUsd');
      await driver.tap(btcToUsd);

      //second Screen
      final enterBtc = find.byValueKey('enter-btc-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterBtc);
      await driver.enterText('0');
      await driver.waitFor(find.text('0'));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid BTC amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is , usdtobtc', () async {
      final usdToBtc = find.byValueKey('usdToBtc');
      await driver.tap(usdToBtc);

      //second Screen
      final enterUsd = find.byValueKey('enter-usd-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterUsd);
      await driver.enterText(',');
      await driver.waitFor(find.text(','));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid USD amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is , btc to usd', () async {
      final btcToUsd = find.byValueKey('btcToUsd');
      await driver.tap(btcToUsd);

      //second Screen
      final enterBtc = find.byValueKey('enter-btc-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterBtc);
      await driver.enterText(',');
      await driver.waitFor(find.text(','));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid BTC amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is . usdtobtc', () async {
      final usdToBtc = find.byValueKey('usdToBtc');
      await driver.tap(usdToBtc);

      //second Screen
      final enterUsd = find.byValueKey('enter-usd-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterUsd);
      await driver.enterText('.');
      await driver.waitFor(find.text('.'));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid USD amount');
      await driver.tap(doneButton);
    });

    test('should give red message if input is . btc to usd', () async {
      final btcToUsd = find.byValueKey('btcToUsd');
      await driver.tap(btcToUsd);

      //second Screen
      final enterBtc = find.byValueKey('enter-btc-field');
      final convertBttn = find.byValueKey('convert-button');
      final warning = find.byValueKey('warning');
      final doneButton = find.byValueKey('done-button');
      await driver.tap(enterBtc);
      await driver.enterText('.');
      await driver.waitFor(find.text('.'));
      await driver.tap(convertBttn);

      expect(await driver.getText(warning), 'Enter a Valid BTC amount');
      await driver.tap(doneButton);
    });
  }, skip: true);
}
