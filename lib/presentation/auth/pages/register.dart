import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/validation/validation.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/routes/routes.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/generated/assets.dart';
import 'package:spotify_app/presentation/auth/auth/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.isDarkMode ? Colors.black : Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
        ),
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? AppColors.lightBackground
                  : AppColors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/Left.svg",
              height: 20,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(AppRoutes.homeScreen.name);
          }
        },
        builder: (context, state) {
          final authBloc = context.read<AuthBloc>();

          if (state is AuthFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 60)), // Spacer

                  /// Title
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          color: context.isDarkMode
                              ? AppColors.lightBackground
                              : AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)), // Spacer

                  /// Support Text
                  SliverToBoxAdapter(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'If You Need Any Support ',
                          style: TextStyle(
                            color: context.isDarkMode
                                ? AppColors.lightBackground
                                : Colors.black,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  click here',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to support screen
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 30)),

                  /// Full Name TextField
                  SliverToBoxAdapter(
                    child: CommonTextField(
                      controller: authBloc.fullNameTextController,
                      hintText: "Full name",
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      validator: (val) =>
                          Validation().validateName("Full name"),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)),

                  /// Email TextField
                  SliverToBoxAdapter(
                    child: CommonTextField(
                      controller: authBloc.emailTextController,
                      hintText: "Enter Email",
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      /*validator: (val) => Validation().validateEmail("Email"),*/
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)),

                  /// Password TextField
                  SliverToBoxAdapter(
                    child: CommonTextField(
                      controller: authBloc.passWordTextController,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      // validator: (val) =>
                      //     Validation().validatePassword("Password"),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)),

                  /// Register Button
                  SliverToBoxAdapter(
                    child: AppButton(
                      height: 65,
                      borderRadius: 20,
                      onTap: () async {
                        context
                            .read<AuthBloc>()
                            .add(Register(context: context));
                      },
                      title: "Create account",
                      fontsize: 20,
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Divider(
                            endIndent: 15,
                            indent: 10,
                            color: AppColors.grey,
                          ),
                        ),
                        Text("or"),
                        Flexible(
                          child: Divider(
                            endIndent: 15,
                            indent: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20)),

                  /// Social Media Login
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesGoogleIcon,
                          height: 30,
                        ),
                        SizedBox(width: 30),
                        Image.asset(
                          Assets.imagesAppleIcon,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                          height: 30,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 40)),

                  /// Register Prompt
                  SliverToBoxAdapter(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Not a member?',
                          style: TextStyle(
                            color: context.isDarkMode
                                ? AppColors.white
                                : Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  Sign In',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SignIn(),
                                  //   ),
                                  // );
                                  // Navigate to register screen
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 40)), // Spacer
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
