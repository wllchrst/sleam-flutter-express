class CommentCreation {
  final String gameId;
  final String userId;
  final String text;

  CommentCreation({
    required this.gameId,
    required this.userId,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'userId': userId,
      'text': text,
    };
  }
}
