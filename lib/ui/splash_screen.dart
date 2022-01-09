import 'package:dari/ui/home.dart';
import 'package:dari/ui/intro_page.dart';
import 'package:dari/ui/login_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> {
  bool finishLoading = false;

  int? _introScreen;
  int? _loginscreen;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    futureInit().then((value) {
      setState(() {
        finishLoading = true;
      });
    });
  }

  Future futureInit() async {
    _prefs = await SharedPreferences.getInstance();

    _introScreen = _prefs!.getInt("intro");
    _loginscreen = _prefs!.getInt("login");
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: (finishLoading)
          ? (_introScreen == null || _introScreen == 1)
              ? IntroPage()
              : (_loginscreen == 1)
                  ? LoginApp()
                  : Home()
          : null,
      imageSize: 150,
      imageSrc: "assets/gatech_logo.png",
      text: "Gatech",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
