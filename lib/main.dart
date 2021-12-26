import 'package:dari/helpers/statics.dart';
import 'package:dari/ui/login_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'helpers/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
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
      initialRoute: RoutesKeys.loginPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


