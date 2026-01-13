import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/common_elevated_button.dart';
import 'package:yunicorn_empulse/core/widgets/input_field.dart';
import 'package:yunicorn_empulse/logic/auth/auth_bloc.dart';
import 'package:yunicorn_empulse/logic/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(TextConstants.loginFailedMessage)),
            );
          }

          if(state is LoginSuccess){
            context.read<AuthBloc>().add(SaveUserAndToken(user: state.user));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImageConstants.login_hero_image,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12.h),
                  Center(
                    child: Image.asset(
                      ImageConstants.splash_yunicorn_image,
                      height: 90.h,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        spacing: 12.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextConstants.login,

                            style: TextStyle(
                              color: ColorContants.purple_text_headings,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            TextConstants.loginScreenSubHeading,

                            style: TextStyle(
                              color: ColorContants.sub_heading_grey,
                              fontSize: 12,
                            ),
                          ),

                          // SizedBox(height: 8),
                          InputField(
                            textEditingController: _emailController,
                            hintText: TextConstants.email,
                          ),
                          InputField(
                            textEditingController: _passwordController,
                            isPasswordField: true,
                            hintText: TextConstants.password,
                            prefixImage: ImageConstants.lock,
                            obsecureText: true,
                          ),

                          SizedBox(height: 8),
                          CommonElevatedButton(
                            buttonText: TextConstants.login,
                            onClick: () {
                              context.read<LoginBloc>().add(
                                ClickOnLoginButtonEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
