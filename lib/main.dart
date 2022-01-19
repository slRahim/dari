import 'dart:async';

import 'package:dari/helpers/statics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'generated/l10n.dart';
import 'helpers/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBVyFt15zcdrhtDHU-p7fsdN5_DY6kLfA0',
      appId: '1:930107122540:android:4094debf835e353ed54949',
      messagingSenderId: '930107122540',
      projectId: 'gatechportal',
    ),
  );
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBVyFt15zcdrhtDHU-p7fsdN5_DY6kLfA0',
        appId: '1:930107122540:android:4094debf835e353ed54949',
        messagingSenderId: '930107122540',
        projectId: 'gatechportal',
      ),
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // if (!kIsWeb) {
    if (true) {
      channel = const AndroidNotificationChannel(
        '55', // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        enableLights: true,
        playSound: true,
        showBadge: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    runApp(MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Dari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Locale('en'),
      initialRoute: RoutesKeys.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
