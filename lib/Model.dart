class CryptoPricedata {
  String symbol;
  String price;
  String prevClosePrice;

  CryptoPricedata({
    required this.symbol,
    required this.price,
    required this.prevClosePrice,
  });

  factory CryptoPricedata.fromJson(Map<String, dynamic> json) {
    return CryptoPricedata(
      symbol: json['symbol'],
      price: json['price'],
      prevClosePrice: json['prevClosePrice'] ?? '0',
    );
  }

  double percentageChange() {
    double currentvalue = double.parse(price);
    double prevPrice = double.parse(price);

    return ((currentvalue   - prevPrice) / prevPrice) * 100;
  }
}

