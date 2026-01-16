import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/trip.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc() : super(TripState.initial()) {
    on<LoadTrips>(loadTrips);
    on<ClickOnViewDetailsButton>(clickOnViewDetailsButton);
  }

  FutureOr<void> loadTrips(LoadTrips event, Emitter<TripState> emit) {
    final tripList = DummyData.dummyTrips;
    emit(TripState(tripList: tripList));
  }

  FutureOr<void> clickOnViewDetailsButton(ClickOnViewDetailsButton event, Emitter<TripState> emit) {
    NavigationService.pushNamed(AppRoutes.tripDetails, arguments: event.trip);
  }
}
