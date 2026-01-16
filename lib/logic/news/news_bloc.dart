import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/news.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/user_filters.dart';
import 'package:yunicorn_empulse/logic/leaderboard/leaderboard_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState.initial()) {
    on<LoadNewsEvent>(loadNewsEvent);
    on<ApplyFiltersEvent>(applyFiltersEvent);
  }

  FutureOr<void> loadNewsEvent(LoadNewsEvent event, Emitter<NewsState> emit) {
    final newsList = DummyData.dummyNews;
    emit(NewsState(newsList: newsList));
  }

  FutureOr<void> applyFiltersEvent(
    ApplyFiltersEvent event,
    Emitter<NewsState> emit,
  ) {
    final newsList = DummyData.dummyNews;
    final filteredList = filterNews(news: newsList, filters: event.filters);
    emit(NewsState(newsList: filteredList));
  }
}

List<News> filterNews({
  required List<News> news,
  required UserFilters filters,
}) {

  if(filters.selectedDepartment == DEPARTMENT.all){
    return news;
  }
  
  return news.where((news) {
    final matchesDepartment =
        filters.selectedDepartment == null ||
        news.department == filters.selectedDepartment;

    return matchesDepartment;
  }).toList();
}
