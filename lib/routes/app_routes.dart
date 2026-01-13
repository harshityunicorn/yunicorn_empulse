import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunicorn_empulse/logic/bottom_nav/bottom_nav_bloc.dart';
import 'package:yunicorn_empulse/representations/dashboard/dashboard_screen.dart';
import 'package:yunicorn_empulse/representations/login/login_screen.dart';
import 'package:yunicorn_empulse/representations/nav_bar/nav_bar.dart';
import 'package:yunicorn_empulse/representations/notifications/notification_screen.dart';
import 'package:yunicorn_empulse/representations/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String navbar = '/navbar';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String notifications = '/notifications';

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
