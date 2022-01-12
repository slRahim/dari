import 'dart:io';

import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/statics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  SharedPreferences ?_prefs;
  String defaultLocale = Platform.localeName;
  String ?_selectedLanguage;

  @override
  void initState() {
    super.initState();
    futureInit();
  }

  Future futureInit() async {
    switch (defaultLocale.substring(0, (2))) {
      case "en":
        _selectedLanguage = Statics.languages[0];
        S.load(Locale("en"));
        break;
      case "fr":
        _selectedLanguage = Statics.languages[1];
        S.load(Locale("fr"));
        break;
      case "ar":
        _selectedLanguage = Statics.languages[2];
        S.load(Locale("ar_DZ"));
        break;
      default:
        _selectedLanguage = Statics.languages[0];
        S.load(Locale("en"));
        break;
    }
    _prefs = await SharedPreferences.getInstance();
  }

  void _onIntroEnd(context)async {
    await saveConfig();
    int ?_loginscreen =  _prefs!.getInt("login");
    if(_loginscreen == 1){
      Navigator.of(context).pushReplacementNamed(RoutesKeys.loginPage);
    }else{
      Navigator.of(context).pushReplacementNamed(RoutesKeys.homePage);
    }
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/otp.gif',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Future saveConfig() async {
    _prefs!.setInt("intro", 0);
    switch (_selectedLanguage) {
      case ("English (ENG)"):
        _prefs!.setString("myLocale", "en");
        break;
      case ("Français (FR)"):
        _prefs!.setString("myLocale", "fr");
        break;
      case ("عربية (AR)"):
        _prefs!.setString("myLocale", "ar");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: S.current.our_mission,
          body:S.current.msg_intro1,
          image: _buildImage('automation.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.current.innovation_engineering,
          body:S.current.msg_intro2,
          image: _buildImage('innovation1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.current.ind_iot,
          body: S.current.msg_intro3,
          image: _buildImage('iot-vector.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      rtl:(Statics.languages.indexOf(_selectedLanguage!) == 2) , // Display as right-to-left
      skip:  Text(S.current.skip),
      next: const Icon(Icons.arrow_forward,size: 30,),
      done:  Text(S.current.done, style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin:  EdgeInsets.all(16),
      controlsPadding:  EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

    );
  }
}
