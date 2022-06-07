import 'package:dhakay/helpers/statics.dart';
import 'package:dhakay/ui/contact.dart';
import 'package:dhakay/ui/home.dart';
import 'package:dhakay/ui/intro_page.dart';
import 'package:dhakay/ui/listing_ui.dart';
import 'package:dhakay/ui/login_app.dart';
import 'package:dhakay/ui/map.dart';
import 'package:dhakay/ui/settings.dart';
import 'package:dhakay/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RoutesKeys.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
        break;
      case RoutesKeys.introPage:
        return MaterialPageRoute(
          builder: (_) => IntroPage(),
        );
        break;
      case RoutesKeys.loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginApp(),
        );
        break;
      case RoutesKeys.homePage:
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      case RoutesKeys.listItems:
        return MaterialPageRoute(
            builder: (_) => ListingPage(argument: args,)
        );
      case RoutesKeys.settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      case RoutesKeys.mapPage:
        return MaterialPageRoute(
          builder: (_) => MapPage(),
        );
      case RoutesKeys.contactPage:
        return MaterialPageRoute(
          builder: (_) => ContactPage(),
        );
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Container());
  }
}