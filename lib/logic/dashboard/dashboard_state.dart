part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashBoardPageLoaded extends DashboardState{
  final List<News> news;
  DashBoardPageLoaded({required this.news});
}
