class KriptoInfo {
  final String pair;
  final double last;
  final double high;
  final double low;
  final double dailypercentage;
  final String currencysymbol;
  final String cryptosymbol;

  KriptoInfo({
    required this.pair,
    required this.last,
    required this.high,
    required this.low,
    required this.dailypercentage,
    required this.currencysymbol,
    required this.cryptosymbol,
  });
}