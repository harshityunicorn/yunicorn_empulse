part of 'trip_bloc.dart';

class TripState {
  List<Trip> tripList;
  TripState({required this.tripList});

  factory TripState.initial() {
    return TripState(tripList: []);
  }
}
