class Notification {
  final String title;
  final String content;
  final bool isRead;
  final String leadingImage;
  final DateTime dateTime;

  const Notification({
    required this.title,
    required this.content,
    required this.dateTime,
    required this.leadingImage,
    this.isRead = false,
  });
}
