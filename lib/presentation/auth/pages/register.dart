import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/routes/routes.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';
import 'package:spotify_app/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_app/generated/assets.dart';
import 'package:spotify_app/service_locator.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passWordTextController = TextEditingController();

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
                  borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                "assets/images/Left.svg",
                height: 20,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              60.heightSizeBox,
              Text(
                "Register",
                style: TextStyle(
                    fontSize: 30,
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
                        fontSize: 14),
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
                controller: fullNameTextController,
                hintText: "Full name",
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                validator: (val) {},
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: emailTextController,
                hintText: "Enter Email",
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
              ),
              20.heightSizeBox,
              AppButton(
                height: 65,
                borderRadius: 20,
                onTap: () async {
                  final result = await s1<RegisterUseCase>().call(
                      params: CreateUserModel(
                          fullName: fullNameTextController.text.trim(),
                          password: passWordTextController.text.trim(),
                          email: emailTextController.text.trim()));

                  /// l means when register failed , r means when register success
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      context.goNamed(AppRoutes.homeScreen.name);
                    },
                  );
                },
                title: "Creat account",
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
                        color:
                            context.isDarkMode ? AppColors.white : Colors.black,
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
