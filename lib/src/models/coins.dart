class Coins {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final num high24H;
  final num low24H;
  final num priceChange24H;
  final num priceChangePercentage24H;

  const Coins({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
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
        currentPrice: json["current_price"] ?? 0,
        high24H: json["high_24h"] ?? 0,
        low24H: json["low_24h"] ?? 0,
        priceChange24H: json["price_change_24h"] ?? 0,
        priceChangePercentage24H: json["price_change_percentage_24h"] ?? 0,
      );
}
