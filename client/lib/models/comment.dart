class Comment {
  final String id;
  final String gameId;
  final String userId;
  final String text;
  final String email;

  Comment({
    required this.id,
    required this.gameId,
    required this.userId,
    required this.text,
    required this.email,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['Id'],
      gameId: json['GameId'],
      userId: json['UserId'],
      text: json['Text'],
      email: json['Email'],
    );
  }
}
