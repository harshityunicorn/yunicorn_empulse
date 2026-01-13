part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {
  final List<Notification> notifications;
  NotificationInitial({required this.notifications});

  factory NotificationInitial.initial(){
    return NotificationInitial(notifications: []);
  }

  
}
