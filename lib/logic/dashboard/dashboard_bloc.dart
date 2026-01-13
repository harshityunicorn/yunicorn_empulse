import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/news.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashBoardLoadEvent>(dashBoardLoadEvent);
    on<ClickOnNotificationButton>(clickOnNotificationButton);
  }

  FutureOr<void> dashBoardLoadEvent(
    DashBoardLoadEvent event,
    Emitter<DashboardState> emit,
  ) {
    final news = DummyData.dummyNews;
    emit(DashBoardPageLoaded(news: news));
  }

  FutureOr<void> clickOnNotificationButton(
    ClickOnNotificationButton event,
    Emitter<DashboardState> emit,
  ) {
    NavigationService.pushNamed(AppRoutes.notifications);
  }
}
