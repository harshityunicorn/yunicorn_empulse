import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/notification/notification_tile.dart';
import 'package:yunicorn_empulse/logic/notification/notification_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(LoadNotificationsEvent()),
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final currentState = state as NotificationInitial;
          return Scaffold(
            appBar: AppBar(title: Text(TextConstants.notification)),

            body: ListView.builder(
              itemCount: currentState.notifications.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  content: currentState.notifications[index].content,
                  icon: Icons.airplanemode_active,
                  title: currentState.notifications[index].title,
                  onTap: () {},
                  date: '12/3/2003',
                  time: '23:23',
                  iconColor: ColorContants.sub_heading_grey,
                  isRead: false,
                  iconBackgroundColor: ColorContants.text_grey_white,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
