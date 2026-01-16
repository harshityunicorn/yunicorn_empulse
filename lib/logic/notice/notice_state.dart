part of 'notice_bloc.dart';

class NoticeState {
  List<Notice> noticeList;
  NoticeState({required this.noticeList});

  factory NoticeState.initial(){
    return NoticeState(noticeList: []);
  }
}

