import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';
import 'package:spotify_app/domain/usecases/auth/sign_in_usecase.dart';
import 'package:spotify_app/generated/assets.dart';
import 'package:spotify_app/presentation/home/pages/home_screen.dart';
import 'package:spotify_app/service_locator.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passWordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
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
                  borderRadius: BorderRadius.circular(20),
                  color: context.isDarkMode
                      ? AppColors.lightBackground
                      : AppColors.grey.withOpacity(0.3)),
              child: SvgPicture.asset(
                "assets/images/Left.svg",
                height: 20,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              80.heightSizeBox,
              Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 28,
                    color: context.isDarkMode
                        ? AppColors.lightBackground
                        : AppColors.darkGrey,
                    fontWeight: FontWeight.w600),
              ),
              20.heightSizeBox,
              RichText(
                text: TextSpan(
                    text: 'If You Need Any Support ',
                    style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.lightBackground
                            : Colors.black,
                        fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  click here',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            })
                    ]),
              ),
              30.heightSizeBox,
              CommonTextField(
                controller: emailTextController,
                hintText: "Enter username or email",
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                validator: (val) {},
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: passWordTextController,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                maxLines: 1,
                validator: (val) {},
                iconPadding: 14,
                suffixIcon: "assets/images/eye_hide.png",
              ),
              25.heightSizeBox,
              Padding(
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
                              : Colors.black),
                    )),
              ),
              25.heightSizeBox,
              AppButton(
                height: 65,
                borderRadius: 20,
                onTap: () async {
                  // context.goNamed(AppRoutes.homeScreen.name);

                  final result = await s1<SignInUseCase>().call(
                      params: CreateUserModel(
                          email: emailTextController.text.trim(),
                          password: passWordTextController.text.trim()));
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                  );
                },
                title: "Sign In",
                fontsize: 20,
              ),
              20.heightSizeBox,
              Row(
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
                  ))
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.imagesGoogleIcon,
                      height: 30,
                    ),
                    30.widthSizeBox,
                    Image.asset(
                      Assets.imagesAppleIcon,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      height: 30,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'not a member ?',
                    style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  register now',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            })
                    ]),
              ),
              40.heightSizeBox
            ],
          ),
        ),
      ),
    );
  }
}
