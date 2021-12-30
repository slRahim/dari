import 'package:dari/ui/login_app.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginApp(),
      duration: 5000,
      imageSize: 150,
      imageSrc: "assets/gatech_logo.png",
      text: "Global Algerian Technology",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold
      ),
      colors: [
        Colors.blue.shade900,
        Colors.blue.shade700,
        Colors.blue.shade500,
        Colors.blue.shade400,
      ],
      backgroundColor: Colors.white,
    );
  }
}
