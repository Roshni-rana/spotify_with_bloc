import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';
import 'package:spotify_app/generated/assets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
        ),
        leading: IconButton(
          icon: Container(
              padding: EdgeInsets.all(7),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                hintText: "Enter username or email",
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                validator: (val) {},
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
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
                onTap: () {},
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
                      Assets.imagesAppleIcon,
                      height: 30,
                    ),
                    30.widthSizeBox,
                    Image.asset(
                      Assets.imagesGoogleIcon,
                      height: 30,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'not a member ?',
                    style: TextStyle(color: Colors.black, fontSize: 18),
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
