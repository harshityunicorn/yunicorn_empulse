class News {
  final String content;
  final bool isStarred;
  final DateTime date;
  final String madeBy;

  const News({
    required this.content,
    required this.date,
    this.isStarred = false,
    required this.madeBy,
  });
}
