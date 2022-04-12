import 'package:bitcoin_calculator/utils/calculations.dart';
import 'package:test/test.dart';

void main() {
  group("USD to BTC", () {
    test("testing calculations for 1 usd", () {
      var test = CurrencyCalculations.usdtobtc(1);
      expect(test, 0.00002287947322300851);
    }, skip: true);

    test("testing calculations for 10 usd", () {
      var test = CurrencyCalculations.usdtobtc(10);
      expect(test, 0.00022879473223008512);
    }, skip: true);

    test("testing calculations for 100 usd", () {
      var test = CurrencyCalculations.usdtobtc(100);
      expect(test, 0.002287947322300851);
    }, skip: true);
  });

  group("BTC to USD", () {
    test("testing calculations for 1 btc", () {
      var test = CurrencyCalculations.btctousd(1);
      expect(test, 43707.3);
    });

    test("testing calculations for 10 btc", () {
      var test = CurrencyCalculations.btctousd(10);
      expect(test, 437073);
    });

    test("testing calculations for 100 btc", () {
      var test = CurrencyCalculations.btctousd(100);
      expect(test, 4370730);
    });
  });
}
