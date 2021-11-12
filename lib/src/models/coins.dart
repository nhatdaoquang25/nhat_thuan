class Coins {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? marketCap;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  String? description;

  Coins(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.high24H,
      this.low24H,
      this.priceChange24H,
      this.marketCap,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.description});

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
        id: json["id"] ?? 'None',
        symbol: json["symbol"] ?? 'None',
        name: json["name"] ?? "None",
        image: json["image"] ?? json["image"]["small"],
        currentPrice: json["current_price"]["usd"].toDouble() ?? 'None',
        marketCap: json["market_cap"]["usd"] ?? 'None',
        high24H: json["high_24h"]["usd"].toDouble() ?? 'None',
        low24H: json["low_24h"]["usd"].toDouble() ?? 'None',
        priceChange24H: json["price_change_24h"].toDouble() ?? 'None',
        circulatingSupply: json["circulating_supply"].toDouble() ?? 'None',
        totalSupply: json["total_supply"].toDouble() ?? 'None',
        maxSupply: json["max_supply"].toDouble() ?? 'None',
        description: json["description"]["en"] ?? 'None',
      );
}
