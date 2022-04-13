import 'package:bitcoin_calculator/utils/calculations.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('when the value is fetched from the API', () {
    test('should return the correct value', () async {
      final client = MockClient();
      final fakeApiResponse =
          '{ "bpi": { "USD": { "rate_float": 41194.9549,  "description": "United States Dollar", "rate": "41194.9549" } } }';

      when(client.get(Uri.parse(
              'https://api.coindesk.com/v1/bpi/currentprice/usd.json')))
          .thenAnswer((_) async => http.Response(fakeApiResponse, 200));

      double value = await CurrencyCalculationsAPI.fetchCurrency(client);
      expect(value, isA<double>());
      expect(value, 41194.9549);
    });
    test('throws an exception', () {
      final client = MockClient();
      when(client.get(Uri.parse(
              'https://api.coindesk.com/v1/bpi/currentprice/usd.json')))
          .thenThrow(Exception());

      expect(CurrencyCalculationsAPI.fetchCurrency(client), throwsException);
    });
  });

  group("USD TO BTC", () {
    test("testing calculations for 1 usd", () {
      var test = CurrencyCalculations.usdtobtc(1);
      expect(test, 0.00002287947322300851);
    });

    test("testing calculations for 10 usd", () {
      var test = CurrencyCalculations.usdtobtc(10);
      expect(test, 0.00022879473223008512);
    });

    test("testing calculations for 100 usd", () {
      var test = CurrencyCalculations.usdtobtc(100);
      expect(test, 0.002287947322300851);
    });

    test("calculations for 1 usd", () async {
      double test = CurrencyCalculationsAPIReal.usdtobtc(1);
      expect(test, 0.000024274817205832164);
    });

    test("calculations for 100 usd", () async {
      double test = CurrencyCalculationsAPIReal.usdtobtc(100);
      expect(test, 0.0024274817205832164);
    });
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

    test("calculations for 1 btc", () async {
      double test = CurrencyCalculationsAPIReal.btctousd(1);
      expect(test, 41194.9549);
    });

    test("calculations for 100 btc", () async {
      double test = CurrencyCalculationsAPIReal.btctousd(100);
      expect(test, 4119495.4899999998);
    });
  });
}
