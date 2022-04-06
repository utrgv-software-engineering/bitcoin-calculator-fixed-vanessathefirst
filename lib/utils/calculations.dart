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
