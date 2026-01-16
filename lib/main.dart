import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/logic/auth/auth_bloc.dart';
import 'package:yunicorn_empulse/logic/leaderboard/leaderboard_bloc.dart';
import 'package:yunicorn_empulse/logic/news/news_bloc.dart';
import 'package:yunicorn_empulse/logic/notice/notice_bloc.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(CheckAuthStatus())),
        BlocProvider(create: (context) => NoticeBloc()..add(LoadNoticesEvent()),),
        BlocProvider(create: (context) => NewsBloc()..add(LoadNewsEvent()),), 
        BlocProvider(create: (context) => LeaderboardBloc()..add(LoadLeaderBoard()),)
      ],
      child: ScreenUtilInit(
        child: MaterialApp(

          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          navigatorKey: NavigationService.navigatorKey,
          themeMode: ThemeMode.light,
          initialRoute: '/', //     /bottom_nav
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
