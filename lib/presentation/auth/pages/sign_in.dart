import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/common/common_textfield.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';
import 'package:spotify_app/generated/assets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 25,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w600),
              ),
              10.heightSizeBox,
              RichText(
                text: TextSpan(
                    text: 'If you need any support ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
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
                hintText: "enter username or email",
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
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Recovery password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              AppButton(
                onTap: () {},
                title: "Sign In",
              ),
              Row(
                children: [Divider(), Text("or"), Divider()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesAppleIcon,
                    height: 30,
                  ),
                  Image.asset(
                    Assets.imagesGoogleIcon,
                    height: 30,
                  ),
                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
