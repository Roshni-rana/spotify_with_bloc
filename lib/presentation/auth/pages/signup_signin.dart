import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/presentation/auth/pages/register.dart';
import 'package:spotify_app/presentation/auth/pages/sign_in.dart';

class SignUpSignIn extends StatelessWidget {
  const SignUpSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Container(
      //       margin: const EdgeInsets.all(8),
      //       decoration: BoxDecoration(
      //         color: Colors.grey.shade300,
      //         shape: BoxShape.circle,
      //       ),
      //       child: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/person_image.png",
                  height: 380,
                )),
            Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/Union.png",
                  height: 120,
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/Union_two.png",
                  height: 250,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 70,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                        fontSize: 22,
                        color: context.isDarkMode
                            ? AppColors.lightBackground
                            : Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: AppColors.c797979),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          height: 60,
                          borderRadius: 20,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          title: "Register",
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AppButton(
                          backgroundColor: Colors.transparent,
                          fontColor:
                              context.isDarkMode ? Colors.white : Colors.black,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          },
                          title: "Sign in",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
