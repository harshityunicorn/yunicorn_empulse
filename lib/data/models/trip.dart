import 'package:flutter/material.dart';

class Trip {
  final String image;
  final String title;
  final String address;
  final String rewardType;
  final int availableSlots;
  final String tripOverview;
  final List<String> tripHighlights;
  final List<String> eligibilityCriteria;
  final List<String> inclusions;
  final Color themeColor;

  const Trip({
    required this.image,
    required this.title,
    required this.address,
    required this.rewardType,
    required this.availableSlots,
    required this.tripOverview,
    required this.tripHighlights,
    required this.eligibilityCriteria,
    required this.inclusions,
    required this.themeColor
  });

  Trip copyWith({
    String? image,
    String? title,
    String? address,
    String? rewardType,
    int? availableSlots,
    String? tripOverview,
    List<String>? tripHighlights,
    List<String>? eligibilityCriteria,
    List<String>? inclusions,
    Color? themeColor
  }) {
    return Trip(
      image: image ?? this.image,
      title: title ?? this.title,
      address: address ?? this.address,
      themeColor: themeColor ?? this.themeColor,
      rewardType: rewardType ?? this.rewardType,
      availableSlots: availableSlots ?? this.availableSlots,
      tripOverview: tripOverview ?? this.tripOverview,
      tripHighlights: tripHighlights ?? this.tripHighlights,
      eligibilityCriteria:
          eligibilityCriteria ?? this.eligibilityCriteria,
      inclusions: inclusions ?? this.inclusions,
    );
  }
}
