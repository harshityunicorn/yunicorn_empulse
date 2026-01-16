import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunicorn_empulse/data/models/trip.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/logic/bottom_nav/bottom_nav_bloc.dart';
import 'package:yunicorn_empulse/representations/announcements/announcements_screen.dart';
import 'package:yunicorn_empulse/representations/dashboard/dashboard_screen.dart';
import 'package:yunicorn_empulse/representations/leaderboard_details/leaderboard_details_screen.dart';
import 'package:yunicorn_empulse/representations/login/login_screen.dart';
import 'package:yunicorn_empulse/representations/nav_bar/nav_bar.dart';
import 'package:yunicorn_empulse/representations/notice_board/notice_board_screen.dart';
import 'package:yunicorn_empulse/representations/notifications/notification_screen.dart';
import 'package:yunicorn_empulse/representations/profile/profile_screen.dart';
import 'package:yunicorn_empulse/representations/splash/splash_screen.dart';
import 'package:yunicorn_empulse/representations/trip_details/trip_details.dart';

class AppRoutes {
  static const String splash = '/';
  static const String navbar = '/navbar';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String leaderBoardDetails = 'leaderboardetails';
  static const String noticeBoard = 'notice_screen';
  static const String announcements = 'announcements';
  static const String tripDetails  = 'trip_details'; 

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case navbar:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BottomNavBloc(),
            child: BottomNavScreen(),
          ),
        );

      case notifications:
        return MaterialPageRoute(builder: (context) => NotificationScreen());

      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case dashboard:
        return MaterialPageRoute(builder: (context) => DashboardScreen());

      case profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      case leaderBoardDetails:
        return MaterialPageRoute(
          builder: (context) => LeaderboardDetailsScreen(user: args as User),
        );

      case noticeBoard:
        return MaterialPageRoute(builder: (context) => NoticeBoardScreen());

      case announcements:
        return MaterialPageRoute(builder: (context) => AnnouncementsScreen());

      case tripDetails : 
        return MaterialPageRoute(builder: (context) => TripDetails(trip: args as Trip,),);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static MaterialPageRoute _errorRoutes(String errorMassage) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for $errorMassage')),
      ),
    );
  }
}
