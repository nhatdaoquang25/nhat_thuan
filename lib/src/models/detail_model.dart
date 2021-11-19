class CoinDetail {
  String id;
  String symbol;
  String name;
  String image;
  String description;
  num currentPrice;
  num priceChangePercentage24H;
  num high24H;
  num low24H;
  num marketCap;
  num circulatingSupply;
  num totalSupply;
  num maxSupply;

  CoinDetail({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.description,
    required this.currentPrice,
    required this.priceChangePercentage24H,
    required this.high24H,
    required this.low24H,
    required this.marketCap,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
  });

  factory CoinDetail.fromJson(Map<String, dynamic> json) => CoinDetail(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"]["thumb"],
        description: json["description"]["en"],
        currentPrice: json["market_data"]["current_price"]["usd"] ?? 0,
        priceChangePercentage24H: json["market_data"]
                ["price_change_percentage_24h_in_currency"]["usd"] ??
            0,
        high24H: json["market_data"]["high_24h"]["usd"] ?? 0,
        low24H: json["market_data"]["low_24h"]["usd"] ?? 0,
        marketCap: json["market_data"]["market_cap"]["usd"] ?? 0,
        circulatingSupply: json["market_data"]["circulating_supply"] ?? 0,
        totalSupply: json["market_data"]["total_supply"] ?? 0,
        maxSupply: json["market_data"]["max_supply"] ?? 0,
      );

  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        description,
        currentPrice,
        priceChangePercentage24H,
        high24H,
        low24H,
        marketCap,
        circulatingSupply,
        totalSupply,
        maxSupply,
      ];
}
