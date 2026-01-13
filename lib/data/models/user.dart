class User {
  final String name;
  final String email;
  final String password;
  final String profile;
  final DEPARTMENT department;
  final int points;
  final int rank;
  final DateTime joinDate;
  final TRIP_ELIGIBILITY tripEligibility;
  final String? image;

  const User({
    required this.email,
    required this.password,
    required this.name,
    required this.profile,
    required this.department,
    required this.joinDate,
    required this.points,
    required this.rank,
    required this.tripEligibility,
    this.image,
  });
}

enum DEPARTMENT { engineering, businessDevelopment, humanResources }

enum TRIP_ELIGIBILITY { qualified, unqualified, pending }
