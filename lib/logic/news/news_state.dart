part of 'news_bloc.dart';

class NewsState {
  final List<News> newsList;
  NewsState({required this.newsList});

  factory NewsState.initial(){
    return NewsState(newsList: []);
  }
}

