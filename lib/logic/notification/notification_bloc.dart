import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial.initial()) {
    on<LoadNotificationsEvent>(loadNotificationEvent);
  }

  FutureOr<void> loadNotificationEvent(
    LoadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) {
    List<Notification> notifications = DummyData.notifications;
    emit(NotificationInitial(notifications: notifications));
  }
}
