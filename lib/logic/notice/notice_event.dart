part of 'notice_bloc.dart';

@immutable
sealed class NoticeEvent {}


class LoadNoticesEvent extends NoticeEvent{}

class ToggleNoticePinEvent extends NoticeEvent{
  Notice notice; 
  ToggleNoticePinEvent({required this.notice});
}