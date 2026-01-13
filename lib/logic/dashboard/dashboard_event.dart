part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashBoardLoadEvent extends DashboardEvent{}

class ClickOnNotificationButton extends DashboardEvent{}
