import 'dart:convert';
import 'package:http/http.dart' as http;

double value;

class CurrencyCalculationsAPI {
  static Future<double> fetchCurrency(http.Client httpclient) async {
    final url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    final response = await httpclient.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      value = json['bpi']['USD']['rate_float'];
      return json['bpi']['USD']['rate_float'];
    } else {
      throw Exception('Failed to load.');
    }
  }
}

class CurrencyCalculationsAPIReal {
  static double usdtobtc(double amount) {
    return amount / 41194.9549;
  }

  static double btctousd(double amount) {
    return amount * 41194.9549;
  }
}

class CurrencyCalculations {
  static double usdtobtc(double amount) {
    double rate = 43707.3;
    return amount / rate;
  }

  static double btctousd(double amount) {
    double rate = 43707.3;
    return amount * rate;
  }
}
