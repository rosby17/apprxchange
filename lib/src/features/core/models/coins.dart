class Coin {
  String name;
  String symbol;
  String image;
  num price;
  num change;
  num changePercentage;
  num rank;

  Coin({
    required this.name,
    required this.symbol,
    required this.image,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.rank,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
      rank: json['market_cap_rank'],
    );
  }
}

List<Coin> coinList = [];
