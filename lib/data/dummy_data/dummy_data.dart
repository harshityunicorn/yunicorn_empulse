import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/data/models/news.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/notification.dart';

class DummyData {
  static List<User> userList = [
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
    User(
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.engineering,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TRIP_ELIGIBILITY.pending,
    ),
  ];

  static List<News> dummyNews = [
    News(
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: true,
    ),
    News(
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: false,
    ),
    News(
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: false,
    ),
  ];

  static List<Notification> notifications = [
    Notification(
      title: "You’ve Earned New Points",
      content:
          "Great job, your performance just added +25 points to your rewards. Keep the momentum going!",
      dateTime: DateTime.now(),
      leadingImage: ImageConstants.arrow_up,
    ),
    Notification(
      title: "You’ve Earned New Points",
      content:
          "Great job, your performance just added +25 points to your rewards. Keep the momentum going!",
      dateTime: DateTime.now(),
      leadingImage: ImageConstants.arrow_up,
    ),
    Notification(
      title: "You’ve Earned New Points",
      content:
          "Great job, your performance just added +25 points to your rewards. Keep the momentum going!",
      dateTime: DateTime.now(),
      leadingImage: ImageConstants.arrow_up,
    ),
    Notification(
      title: "You’ve Earned New Points",
      content:
          "Great job, your performance just added +25 points to your rewards. Keep the momentum going!",
      dateTime: DateTime.now(),
      leadingImage: ImageConstants.arrow_up,
    ),
    Notification(
      title: "You’ve Earned New Points",
      content:
          "Great job, your performance just added +25 points to your rewards. Keep the momentum going!",
      dateTime: DateTime.now(),
      leadingImage: ImageConstants.arrow_up,
    ),
  ];
}
