import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/presentation/auth/pages/sign_in.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/choose_bg_image.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 40,
                    )),
                Spacer(),
                Text(
                  "Choose Mode",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.darkGrey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: SvgPicture.asset(
                                  "assets/images/Moon.svg",
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dark Mode",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.darkGrey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: SvgPicture.asset(
                                  "assets/images/sun.svg",
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Light Mode",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                AppButton(
                    height: 55,
                    borderRadius: 20,
                    onTap: () {
                      print("Button tapped 2");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignIn()));
                    },
                    title: "Continue")
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
