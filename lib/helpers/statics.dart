import 'package:dhakay/generated/l10n.dart';

class Statics {
  static const RoutesKeys routes = const RoutesKeys();

  static List<String> languages = [
    "English (ENG)",
    "Français (FR)",
    "عربية (AR)"
  ];
  static List<String> themeStyle = [
   S.current.light_theme,
    S.current.dark_them,
  ];
}

class RoutesKeys {
  const RoutesKeys();
  static const introPage = '/intro' ;
  static const homePage = '/home_page';
  static const loginPage = '/loginPage';
  static const listItems = "/listItems";
  static const settingsPage = '/settingsPage';
  static const contactPage = '/ContactPage';
  static const mapPage = "/mapPage";
  static const splashScreen = "/splashScreen" ;
}