// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dhakay`
  String get app_name {
    return Intl.message(
      'Dhakay',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light_theme {
    return Intl.message(
      'Light',
      name: 'light_theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark_them {
    return Intl.message(
      'Dark',
      name: 'dark_them',
      desc: '',
      args: [],
    );
  }

  /// `Our Mission`
  String get our_mission {
    return Intl.message(
      'Our Mission',
      name: 'our_mission',
      desc: '',
      args: [],
    );
  }

  /// `GATECH specializes in all electrical systems, automation, instrumentation, supervision systems`
  String get msg_intro1 {
    return Intl.message(
      'GATECH specializes in all electrical systems, automation, instrumentation, supervision systems',
      name: 'msg_intro1',
      desc: '',
      args: [],
    );
  }

  /// `Innovation & Engineering`
  String get innovation_engineering {
    return Intl.message(
      'Innovation & Engineering',
      name: 'innovation_engineering',
      desc: '',
      args: [],
    );
  }

  /// `the character inovation is the first principle of our company we aim to develop solutions 100% Algerian and create value add for our environment`
  String get msg_intro2 {
    return Intl.message(
      'the character inovation is the first principle of our company we aim to develop solutions 100% Algerian and create value add for our environment',
      name: 'msg_intro2',
      desc: '',
      args: [],
    );
  }

  /// `Industrial IoT`
  String get ind_iot {
    return Intl.message(
      'Industrial IoT',
      name: 'ind_iot',
      desc: '',
      args: [],
    );
  }

  /// `Local solutions for the exploitation and use of IoT in the industrial sector`
  String get msg_intro3 {
    return Intl.message(
      'Local solutions for the exploitation and use of IoT in the industrial sector',
      name: 'msg_intro3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Authentication`
  String get authentication {
    return Intl.message(
      'Authentication',
      name: 'authentication',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pin code to access the application`
  String get msg_login {
    return Intl.message(
      'Enter your pin code to access the application',
      name: 'msg_login',
      desc: '',
      args: [],
    );
  }

  /// `Please, Fill all gaps`
  String get msg_err_login {
    return Intl.message(
      'Please, Fill all gaps',
      name: 'msg_err_login',
      desc: '',
      args: [],
    );
  }

  /// `* Wrong pin code, Try again`
  String get msg_err_password {
    return Intl.message(
      '* Wrong pin code, Try again',
      name: 'msg_err_password',
      desc: '',
      args: [],
    );
  }

  /// `Login using biometrics ?`
  String get msg_login_biometrics {
    return Intl.message(
      'Login using biometrics ?',
      name: 'msg_login_biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `sign in`
  String get singin {
    return Intl.message(
      'sign in',
      name: 'singin',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to access the application`
  String get msg_auth_biometrics1 {
    return Intl.message(
      'Please authenticate to access the application',
      name: 'msg_auth_biometrics1',
      desc: '',
      args: [],
    );
  }

  /// `Authentication required`
  String get msg_auth_required {
    return Intl.message(
      'Authentication required',
      name: 'msg_auth_required',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Successfully authenticated`
  String get msg_auth_success {
    return Intl.message(
      'Successfully authenticated',
      name: 'msg_auth_success',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed try again`
  String get msg_auth_error {
    return Intl.message(
      'Authentication failed try again',
      name: 'msg_auth_error',
      desc: '',
      args: [],
    );
  }

  /// `Config biometric identity`
  String get msg_config_biometrics {
    return Intl.message(
      'Config biometric identity',
      name: 'msg_config_biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Lockout`
  String get lockout {
    return Intl.message(
      'Lockout',
      name: 'lockout',
      desc: '',
      args: [],
    );
  }

  /// `No available biometrics`
  String get msg_no_biometrics {
    return Intl.message(
      'No available biometrics',
      name: 'msg_no_biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Your device don't support biometrics`
  String get msg_no_support_biometrics {
    return Intl.message(
      'Your device don\'t support biometrics',
      name: 'msg_no_support_biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Do you want exit the app`
  String get msg_exit {
    return Intl.message(
      'Do you want exit the app',
      name: 'msg_exit',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to quit the app`
  String get msg_exit1 {
    return Intl.message(
      'Press back again to quit the app',
      name: 'msg_exit1',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Electrical`
  String get electrical {
    return Intl.message(
      'Electrical',
      name: 'electrical',
      desc: '',
      args: [],
    );
  }

  /// `Instrumentation`
  String get instrumentation {
    return Intl.message(
      'Instrumentation',
      name: 'instrumentation',
      desc: '',
      args: [],
    );
  }

  /// `Automation`
  String get automation {
    return Intl.message(
      'Automation',
      name: 'automation',
      desc: '',
      args: [],
    );
  }

  /// `Electronic maintenance`
  String get electronic_maintenance {
    return Intl.message(
      'Electronic maintenance',
      name: 'electronic_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `3D scanning`
  String get d_scaning {
    return Intl.message(
      '3D scanning',
      name: 'd_scaning',
      desc: '',
      args: [],
    );
  }

  /// `Generale`
  String get generale {
    return Intl.message(
      'Generale',
      name: 'generale',
      desc: '',
      args: [],
    );
  }

  /// `Founded 2019`
  String get founded {
    return Intl.message(
      'Founded 2019',
      name: 'founded',
      desc: '',
      args: [],
    );
  }

  /// `Company size 51-200 employees`
  String get company_size {
    return Intl.message(
      'Company size 51-200 employees',
      name: 'company_size',
      desc: '',
      args: [],
    );
  }

  /// `Activity zone baba ali Shaoula,Alger`
  String get company_address {
    return Intl.message(
      'Activity zone baba ali Shaoula,Alger',
      name: 'company_address',
      desc: '',
      args: [],
    );
  }

  /// `Production unite`
  String get company_field {
    return Intl.message(
      'Production unite',
      name: 'company_field',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get msg_valid_mail {
    return Intl.message(
      'Enter a valid email address',
      name: 'msg_valid_mail',
      desc: '',
      args: [],
    );
  }

  /// `Object`
  String get object {
    return Intl.message(
      'Object',
      name: 'object',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid text`
  String get msg_valid_text {
    return Intl.message(
      'Enter valid text',
      name: 'msg_valid_text',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Your text here !`
  String get msg_your_text {
    return Intl.message(
      'Your text here !',
      name: 'msg_your_text',
      desc: '',
      args: [],
    );
  }

  /// `Fill all required fields`
  String get msg_required_field {
    return Intl.message(
      'Fill all required fields',
      name: 'msg_required_field',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutus {
    return Intl.message(
      'About us',
      name: 'aboutus',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactus {
    return Intl.message(
      'Contact us',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `E-Payment Portal`
  String get epayment_portal {
    return Intl.message(
      'E-Payment Portal',
      name: 'epayment_portal',
      desc: '',
      args: [],
    );
  }

  /// `You are about to pay your water bill with your CIB / EDAHABIA Secure card`
  String get details_ade1 {
    return Intl.message(
      'You are about to pay your water bill with your CIB / EDAHABIA Secure card',
      name: 'details_ade1',
      desc: '',
      args: [],
    );
  }

  /// `You are about to pay your electricity and gas bill with your CIB/EDAHABIA Secure card`
  String get details_sonelgaz1 {
    return Intl.message(
      'You are about to pay your electricity and gas bill with your CIB/EDAHABIA Secure card',
      name: 'details_sonelgaz1',
      desc: '',
      args: [],
    );
  }

  /// `Water Monitoring System`
  String get water_monitoring {
    return Intl.message(
      'Water Monitoring System',
      name: 'water_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `Gas Monitoring System`
  String get gas_monitoring {
    return Intl.message(
      'Gas Monitoring System',
      name: 'gas_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `Smart City Monitoring System`
  String get smartcity_monitoring {
    return Intl.message(
      'Smart City Monitoring System',
      name: 'smartcity_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `Green Energy Monitoring System`
  String get energie_monitoring {
    return Intl.message(
      'Green Energy Monitoring System',
      name: 'energie_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `Remote supervision and control of a water treatment or pumping station from a smartphone`
  String get details_ade2 {
    return Intl.message(
      'Remote supervision and control of a water treatment or pumping station from a smartphone',
      name: 'details_ade2',
      desc: '',
      args: [],
    );
  }

  /// `Remote monitoring and control of gas connections and leaks from a smartphone`
  String get details_sonelgaz2 {
    return Intl.message(
      'Remote monitoring and control of gas connections and leaks from a smartphone',
      name: 'details_sonelgaz2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get details_smartcity1 {
    return Intl.message(
      '',
      name: 'details_smartcity1',
      desc: '',
      args: [],
    );
  }

  /// `A simulation of remote monitoring and control of a smart city remotly`
  String get details_smartcity2 {
    return Intl.message(
      'A simulation of remote monitoring and control of a smart city remotly',
      name: 'details_smartcity2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get details_energie1 {
    return Intl.message(
      '',
      name: 'details_energie1',
      desc: '',
      args: [],
    );
  }

  /// `Monitoring and remote management system for solar and wind energy`
  String get details_energie2 {
    return Intl.message(
      'Monitoring and remote management system for solar and wind energy',
      name: 'details_energie2',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to go back without saving last changes?`
  String get msg_back_no_save {
    return Intl.message(
      'Do you want to go back without saving last changes?',
      name: 'msg_back_no_save',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to save last changes?`
  String get msg_save {
    return Intl.message(
      'Do you want to save last changes?',
      name: 'msg_save',
      desc: '',
      args: [],
    );
  }

  /// `Display language`
  String get display_language {
    return Intl.message(
      'Display language',
      name: 'display_language',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Edit your pin code`
  String get edit_password {
    return Intl.message(
      'Edit your pin code',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `Lock screen`
  String get lock_screen {
    return Intl.message(
      'Lock screen',
      name: 'lock_screen',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get on {
    return Intl.message(
      'On',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Leave your feedback`
  String get msg_rate {
    return Intl.message(
      'Leave your feedback',
      name: 'msg_rate',
      desc: '',
      args: [],
    );
  }

  /// `Global Algerian Technology`
  String get company_name {
    return Intl.message(
      'Global Algerian Technology',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `MAKE YOUR LIFE \n SMART `
  String get company_name1 {
    return Intl.message(
      'MAKE YOUR LIFE \n SMART ',
      name: 'company_name1',
      desc: '',
      args: [],
    );
  }

  /// `Smart City`
  String get smartcity {
    return Intl.message(
      'Smart City',
      name: 'smartcity',
      desc: '',
      args: [],
    );
  }

  /// `Sonelgaz`
  String get sonelgaz {
    return Intl.message(
      'Sonelgaz',
      name: 'sonelgaz',
      desc: '',
      args: [],
    );
  }

  /// `Ade`
  String get ade {
    return Intl.message(
      'Ade',
      name: 'ade',
      desc: '',
      args: [],
    );
  }

  /// `Green Energy`
  String get energieverte {
    return Intl.message(
      'Green Energy',
      name: 'energieverte',
      desc: '',
      args: [],
    );
  }

  /// `Pin code has successfully changed`
  String get msg_pincode_save {
    return Intl.message(
      'Pin code has successfully changed',
      name: 'msg_pincode_save',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pin code`
  String get enter_pin_code {
    return Intl.message(
      'Enter your pin code',
      name: 'enter_pin_code',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your pin code`
  String get confirm_pin_code {
    return Intl.message(
      'Confirm your pin code',
      name: 'confirm_pin_code',
      desc: '',
      args: [],
    );
  }

  /// `to secure your app`
  String get msg_secure_app {
    return Intl.message(
      'to secure your app',
      name: 'msg_secure_app',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'DZ'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
