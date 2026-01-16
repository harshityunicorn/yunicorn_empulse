class Notice {
  final String byTeam;
  final String content;
  final String title;
  final DateTime date;
  final bool isPinned;
  final Category category;

  const Notice({
    required this.byTeam,
    required this.content,
    required this.date,
    required this.title,
    this.isPinned = false,
    this.category = Category.general,
  });

  Notice copyWith({
    String? byTeam,
    String? content,
    String? title,
    DateTime? date,
    bool? isPinned,
    Category? category,
  }) {
    return Notice(
      byTeam: byTeam ?? this.byTeam,
      content: content ?? this.content,
      title: title ?? this.title,
      date: date ?? this.date,
      isPinned: isPinned ?? this.isPinned,
      category: category ?? this.category,
    );
  }
}

enum Category {
  general,
  trip,
  policy,
}
