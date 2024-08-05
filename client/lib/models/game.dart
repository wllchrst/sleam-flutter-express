class Game {
  final String id;
  final String name;
  final String description;
  final int price;
  Game({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['Id'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'],
    );
  }
}
