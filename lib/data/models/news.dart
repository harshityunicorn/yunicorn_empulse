import 'package:yunicorn_empulse/data/models/user.dart';

class News {
  final String content;
  final bool isStarred;
  final DateTime date;
  final String madeBy;
  final String title;
  final DEPARTMENT department;

  const News({
    required this.title,
    required this.content,
    required this.date,
    this.isStarred = false,
    required this.madeBy,
    this.department = DEPARTMENT.all
  });
}
