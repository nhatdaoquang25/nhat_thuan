class Coins {
  String id;
  String symbol;
  String name;
  String? image;
  int? currentPrice;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;

  Coins({
    required this.id,
    required this.symbol,
    required this.name,
    this.image,
    this.currentPrice,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
  });

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice:
            json["current_price"] == null ? 0 : json["current_price"].toInt(),
        high24H: json["high_24h"] == null ? 0 : json["high_24h"].toDouble(),
        low24H: json["low_24h"] == null ? 0 : json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"] == null
            ? 0
            : json["price_change_24h"].toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"] == null
            ? 0
            : json["price_change_percentage_24h"].toDouble(),
      );
}
