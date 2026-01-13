part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitial extends BottomNavState {
  final int index;
  BottomNavInitial({required this.index});
  factory BottomNavInitial.initial() {
    return BottomNavInitial(index: 0);
  }

  BottomNavState copyWith({int? index}) {
    return BottomNavInitial(index: index ?? this.index);
  }
}
