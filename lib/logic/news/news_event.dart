part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}


class LoadNewsEvent extends NewsEvent{}

class ApplyFiltersEvent extends NewsEvent{
  final UserFilters filters;
  ApplyFiltersEvent({required this.filters});
}