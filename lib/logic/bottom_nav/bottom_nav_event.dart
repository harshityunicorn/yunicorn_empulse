part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class BottomNavBarClickedEvent extends BottomNavEvent{
  final int index;
  BottomNavBarClickedEvent({required this.index});
}