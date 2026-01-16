import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/notice.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeBloc() : super(NoticeState.initial()) {
    on<LoadNoticesEvent>(loadNoticeEvent);
    on<ToggleNoticePinEvent>(toggleNoticePintEvent);
  }

  FutureOr<void> loadNoticeEvent(
    LoadNoticesEvent event,
    Emitter<NoticeState> emit,
  ) {
    final sortedList = List<Notice>.from(DummyData.dummyNotices);

    sortedList.sort((a, b) {
      // 1️⃣ Pinned notices first
      if (a.isPinned != b.isPinned) {
        return a.isPinned ? -1 : 1;
      }

      // 2️⃣ Newest date first
      return b.date.compareTo(a.date);
    });

    print(sortedList.length);
    emit(NoticeState(noticeList: sortedList));
  }

  FutureOr<void> toggleNoticePintEvent(
    ToggleNoticePinEvent event,
    Emitter<NoticeState> emit,
  ) {
    final noticeList = state.noticeList;
    int index = noticeList.indexOf(event.notice);
    print('index of toggled notice = ${index}');
    final updatedList = List.generate(noticeList.length, (i) {
      if (index == i) {
        return noticeList[i].copyWith(isPinned: !noticeList[i].isPinned);
      }
      return noticeList[i];
    });

    updatedList.sort((a, b) {
      if (a.isPinned != b.isPinned) {
        return a.isPinned ? -1 : 1;
      }

      // 2️⃣ Newest date first
      return b.date.compareTo(a.date);
    });
    print(updatedList.length);
    emit(NoticeState(noticeList: updatedList));
  }
}
