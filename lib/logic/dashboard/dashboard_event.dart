part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashBoardLoadEvent extends DashboardEvent {}

class ClickOnNotificationButton extends DashboardEvent {}

class ClickOnProfileButton extends DashboardEvent {}

class ClickOnNoticeBoardViewAllButton extends DashboardEvent {}

class ClickOnNewsViewAllButton extends DashboardEvent{}
