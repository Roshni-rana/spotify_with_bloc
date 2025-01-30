import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/routes/routes.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/generated/assets.dart';
import 'package:spotify_app/presentation/auth/auth/auth_bloc.dart';
import 'package:spotify_app/presentation/auth/pages/register.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passWordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: context.isDarkMode ? Colors.black : Colors.transparent,
        centerTitle: true,
        title: Image.asset("assets/images/logo.png", height: 30),
        leading: IconButton(
          icon: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.isDarkMode
                      ? AppColors.lightBackground
                      : AppColors.grey.withOpacity(0.3)),
              child: SvgPicture.asset(
                "assets/images/Left.svg",
                height: 20,
              )),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(AppRoutes.homeScreen.name);
          }
        },
        builder: (context, state) {
          final authBloc = context.read<AuthBloc>();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  const SliverPadding(padding: EdgeInsets.only(top: 80)),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 28,
                          color: context.isDarkMode
                              ? AppColors.lightBackground
                              : AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  SliverToBoxAdapter(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'If You Need Any Support ',
                          style: TextStyle(
                            color: context.isDarkMode
                                ? AppColors.lightBackground
                                : Colors.black,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: ' click here',
                              style: const TextStyle(
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
                  const SliverPadding(padding: EdgeInsets.only(top: 30)),
                  SliverToBoxAdapter(
                    child: CommonTextField(
                      controller: authBloc.emailTextController,
                      hintText: "Enter username or email",
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      validator: (val) {},
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  SliverToBoxAdapter(
                    child: CommonTextField(
                      controller: authBloc.passWordTextController,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      validator: (val) {},
                      iconPadding: 14,
                      suffixIcon: "assets/images/eye_hide.png",
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 25)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Recovery password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode
                                ? AppColors.lightBackground.withOpacity(0.7)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 25)),
                  SliverToBoxAdapter(
                    child: AppButton(
                      height: 65,
                      borderRadius: 20,
                      onTap: () async {
                        context.read<AuthBloc>().add(SignIn(context: context));
                      },
                      title: "Sign In",
                      fontsize: 20,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
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
                        const Text("or"),
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
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesGoogleIcon,
                          height: 30,
                        ),
                        const SizedBox(width: 30),
                        Image.asset(
                          Assets.imagesAppleIcon,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  SliverToBoxAdapter(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Not a member?',
                          style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: ' Register now',
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 40)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
