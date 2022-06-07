import 'package:dhakay/generated/l10n.dart';
import 'package:dhakay/main.dart';
import 'package:dhakay/ui/home.dart';
import 'package:dhakay/ui/intro_page.dart';
import 'package:dhakay/ui/login_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> {
  bool finishLoading = false;
  List<Locale> localeList = [Locale('en'), Locale('fr'), Locale('ar_DZ')];
  int? _introScreen;
  int? _loginscreen;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print(message) ;
        // Navigator.pushNamed(
        //   context,
        //   '/message',
        //   arguments: MessageArguments(message, true),
        // );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null ) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,

          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription : channel.description,
              icon: 'launch_background',
              importance: Importance.max,
              priority: Priority.high,
              playSound: channel.playSound,
              enableLights: channel.enableLights,
              channelShowBadge: channel.showBadge,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });

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
    String ?_locale = _prefs!.getString("myLocale");
    String ?_theme = _prefs!.getString("myStyle");

    switch (_locale) {
      case ("en"):
        await S.load(Locale('en'));
        break;
      case ("fr"):
        await S.load(Locale('fr'));
        break;
      case ("ar"):
        await S.load(Locale('ar_DZ'));
        break;
      default:
        await S.load(Locale('en'));
        break;
    }
    switch (_theme) {
      case ("light"):

        break;
      case ("dark"):

        break;
      default:

        break;
    }

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
      imageSrc: "assets/logo_dhakay_1920.png",
      backgroundColor: Colors.white,
    );
  }
}
