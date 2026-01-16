part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class LoadTrips extends TripEvent {}

class ClickOnViewDetailsButton extends TripEvent {
  Trip trip;
  ClickOnViewDetailsButton({required this.trip});
}
