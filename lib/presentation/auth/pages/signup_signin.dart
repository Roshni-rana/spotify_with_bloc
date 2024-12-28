import 'package:flutter/material.dart';
import 'package:spotify_app/common/widgets/button/app_button.dart';

class SignUpSignIn extends StatelessWidget {
  const SignUpSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 70,
                    )),
                Text("Enjoy listening to music"),
                Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider"),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onTap: () {},
                        title: "Register",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppButton(
                        onTap: () {},
                        title: "Register",
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
