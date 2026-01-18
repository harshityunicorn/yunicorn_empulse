import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/data/models/news.dart';
import 'package:yunicorn_empulse/data/models/notice.dart';
import 'package:yunicorn_empulse/data/models/point_history.dart';
import 'package:yunicorn_empulse/data/models/trip.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/notification.dart';

class DummyData {
  static List<User> userList = [
    User(
      id: "YC-00063",
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.development,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 1,
      tripEligibility: TripEligibility(
        eligibility: ELIGIBILITY.eligible,
        trip: TRIPS.dubai,
      ),
    ),
    User(
      id: "YC-00063",
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.development,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 2,
      tripEligibility: TripEligibility(
        eligibility: ELIGIBILITY.eligible,
        trip: TRIPS.dubai,
      ),
    ),
    User(
      id: "YC-00063",
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.development,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TripEligibility(
        eligibility: ELIGIBILITY.eligible,
        trip: TRIPS.dubai,
      ),
    ),
    User(
      id: "YC-00063",
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.development,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 3,
      tripEligibility: TripEligibility(
        eligibility: ELIGIBILITY.eligible,
        trip: TRIPS.dubai,
      ),
    ),

    User(
      id: "YC-00063",
      email: 'harshit@gmail.com',
      password: '12345678',
      name: 'Harshit vishvakarma',
      profile: 'Junior flutter developer',
      department: DEPARTMENT.development,
      joinDate: DateTime(2025, DateTime.december, 20),
      points: 880,
      rank: 5,
      tripEligibility: TripEligibility(
        eligibility: ELIGIBILITY.eligible,
        trip: TRIPS.dubai,
      ),
    ),
  ];

  static List<News> dummyNews = [
    News(
      title: 'Dubai Trip Cutoff Extended!',
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: true,
    ),
    News(
      title: 'Dubai Trip Cutoff Extended!',
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: true,
    ),
    News(
      title: 'Dubai Trip Cutoff Extended!',
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: true,
    ),
    News(
      title: 'Dubai Trip Cutoff Extended!',
      content: "Great news! We've increased the Dubai trip spots from...",
      date: DateTime.now().toLocal(),
      madeBy: "HR",
      isStarred: true,
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

  static List<PointHistory> dummyPointHistory = [
    PointHistory(
      userId: "YC-00063",
      points: 50,
      reason: "Recognized for consistent excellence and exceeding goals.",
      by: "Project Manager",
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: 20,
      reason: "Earned when teammates appreciate your collaboration or support.",
      by: "HR Department",
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: -10,
      reason: "Late submission of report",
      by: "Team Lead",
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: 100,
      reason: "Outstanding quarterly performance",
      by: "Management",
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: 30,
      reason: "Client appreciation",
      by: "Business Development Head",
      dateTime: DateTime.now().subtract(const Duration(days: 15)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: -5,
      reason: "Missed internal meeting",
      by: "HR Department",
      dateTime: DateTime.now().subtract(const Duration(days: 18)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: 75,
      reason: "Innovation award",
      by: "Innovation Committee",
      dateTime: DateTime.now().subtract(const Duration(days: 25)),
    ),
    PointHistory(
      userId: "YC-00063",
      points: 40,
      reason: "Mentoring junior team members",
      by: "Engineering Manager",
      dateTime: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  static List<Notice> dummyNotices = [
    Notice(
      byTeam: 'HR Team',
      title: 'Holiday Announcement',
      content:
          'The office will remain closed on Friday due to a public holiday. '
          'Please plan your work accordingly.',
      date: DateTime(2026, 1, 10),
      isPinned: true,
    ),
    Notice(
      byTeam: 'Admin Team',
      title: 'Office Maintenance',
      content:
          'Scheduled maintenance will take place this weekend. '
          'Some facilities may be temporarily unavailable.',
      date: DateTime(2026, 1, 8),
    ),
    Notice(
      byTeam: 'Tech Team',
      title: 'System Upgrade',
      content:
          'A system upgrade is planned for tonight from 11 PM to 2 AM. '
          'There might be intermittent downtime during this period.',
      date: DateTime(2026, 1, 6),
    ),
    Notice(
      byTeam: 'Management',
      title: 'Quarterly Town Hall',
      content:
          'Join us for the quarterly town hall meeting this Thursday at 4 PM. '
          'We look forward to your participation.',
      date: DateTime(2026, 1, 5),
    ),
    Notice(
      byTeam: 'HR Team',
      title: 'Policy Update',
      content:
          'The updated leave and attendance policy has been published. '
          'Please review it on the employee portal.',
      date: DateTime(2026, 1, 3),
    ),
  ];

  static List<Trip> dummyTrips = [
    Trip(
      image: ImageConstants.dubai_hero,
      title: "Dubai",
      address: "Dubai, UAE",
      themeColor: ColorContants.dubaiOrange,
      rewardType: "International trip",
      availableSlots: 10,
      tripOverview:
          "Experience the vibrant charm of Dubai, a city where innovation meets luxury.From sky-high adventures to desert sunsets, this 5-day reward trip celebrates your outstanding performance and commitment to excellence. ",
      tripHighlights: [
        'Stay at a 5-star resort in Downtown Dubai',
        'Desert safari and dune bashing experience',
        'Visit Burj Khalifa and Dubai Frame',
        'Luxury yacht dinner with leadership team',
        'Exclusive shopping and cultural exploration commitment to excellence',
      ],
      eligibilityCriteria: [
        'Minimum 900 points by December 10, 2025',
        'Consistent quarterly performance',
        'Top 10 leaderboard position',
      ],
      inclusions: [
        'Round-trip airfare',
        'Luxury accommodation',
        'Meals and guided excursions',
        'Special gala dinner and recognition ceremony',
      ],
    ),
    Trip(
      image: ImageConstants.europe_hero,
      title: "Europe",
      address: "Paris, Rome, Zurich",
      rewardType: "International trip",
      availableSlots: 10,
      themeColor: ColorContants.purple_text_headings,
      tripOverview:
          "Experience the vibrant charm of Dubai, a city where innovation meets luxury.From sky-high adventures to desert sunsets, this 5-day reward trip celebrates your outstanding performance and commitment to excellence. ",
      tripHighlights: [
        'Stay at a 5-star resort in Downtown Dubai',
        'Desert safari and dune bashing experience',
        'Visit Burj Khalifa and Dubai Frame',
        'Luxury yacht dinner with leadership team',
        'Exclusive shopping and cultural exploration commitment to excellence',
      ],
      eligibilityCriteria: [
        'Minimum 900 points by December 10, 2025',
        'Consistent quarterly performance',
        'Top 10 leaderboard position',
      ],
      inclusions: [
        'Round-trip airfare',
        'Luxury accommodation',
        'Meals and guided excursions',
        'Special gala dinner and recognition ceremony',
      ],
    ),
  ];
}
