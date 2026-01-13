import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/logic/auth/auth_bloc.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state.runtimeType);
        if (state is AuthUnauthenticated) {
          Future.delayed(
            const Duration(seconds: 2),
            () => NavigationService.pushReplacementNamed(AppRoutes.login),
          );
        }
        if (state is AuthAuthenticated) {
          Future.delayed(
            const Duration(seconds: 2),
            () => NavigationService.pushReplacementNamed(AppRoutes.navbar),
          );
        }
      },
      builder: (context, state) {
        return Container(
          color: ColorContants.brand_secondary,
          child: Center(
            child: Image.asset(
              ImageConstants.splash_yunicorn_image,
              height: 121,
              width: 300,
            ),
          ),
        );
      },
    );
  }
}
