import 'package:yunicorn_empulse/core/constants/enums.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String profile;
  final DEPARTMENT department;
  final int points;
  final int rank;
  final DateTime joinDate;
  final TripEligibility tripEligibility;
  final String? image;
  final String id;

  const User({
    required this.id,
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

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? profile,
    DEPARTMENT? department,
    int? points,
    int? rank,
    DateTime? joinDate,
    TripEligibility? tripEligibility,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profile: profile ?? this.profile,
      department: department ?? this.department,
      points: points ?? this.points,
      rank: rank ?? this.rank,
      joinDate: joinDate ?? this.joinDate,
      tripEligibility: tripEligibility ?? this.tripEligibility,
      image: image ?? this.image,
    );
  }
}

class TripEligibility {
  TRIPS trip;
  ELIGIBILITY eligibility;

  TripEligibility({required this.eligibility, required this.trip});
}

enum DEPARTMENT { development, business, humanResources, design, marketing, qa, all }

enum ELIGIBILITY { eligible, uneligible, pending }
