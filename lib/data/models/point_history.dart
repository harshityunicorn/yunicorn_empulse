class PointHistory {
  final String reason;
  final String by;
  final DateTime dateTime;
  final int points;
  final String userId;

  const PointHistory({
    required this.points,
    required this.reason,
    required this.by,
    required this.dateTime,
    required this.userId
  });
}
