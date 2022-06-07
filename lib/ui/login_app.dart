import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dhakay/generated/l10n.dart';
import 'package:dhakay/helpers/helpers.dart';
import 'package:dhakay/helpers/statics.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  var localAuth = LocalAuthentication();
  DateTime? currentBackPressTime;

  SharedPreferences? _prefs;
  String _codepin = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    futureInit() ;
    super.initState();
  }

  futureInit() async {
    _prefs = await SharedPreferences.getInstance();
    String? res = _prefs!.getString("codepin");
    if (res != null && res.isNotEmpty) {
      _codepin = res;
    }
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/otp.gif"),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(S.current.authentication,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: S.current.msg_login,
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 4) {
                          return S.current.msg_err_login;
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 70,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: Colors.lightBlue,
                          inactiveFillColor: Colors.white,
                          inactiveColor: Colors.black54
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? S.current.msg_err_password : "",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.msg_login_biometrics,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                      onPressed:_authBiometric,
                      child: Text(
                        S.current.scan,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      if (currentText.length != 4 || currentText != _codepin) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                              () {
                            hasError = false;
                            Navigator.pushReplacementNamed(
                                context, RoutesKeys.homePage);
                          },
                        );
                      }
                    },
                    child: Center(
                        child: Text(
                          S.current.singin.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade300,
                          offset: Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.blue.shade300,
                          offset: Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _authBiometric() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    var res;
    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics = await localAuth
          .getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        res = await localAuth.authenticate(
            localizedReason: S.current.msg_auth_biometrics1,
            androidAuthStrings: AndroidAuthMessages(
                signInTitle: S.current.msg_auth_required,
                biometricHint: '',
                cancelButton: S.current.cancel,
                biometricSuccess: S.current.msg_auth_success,
                biometricNotRecognized: S.current.msg_auth_error,
                goToSettingsButton: S.current.msg_config_biometrics
            ),
            iOSAuthStrings: IOSAuthMessages(
              lockOut: S.current.lockout,
              cancelButton: S.current.cancel,
              goToSettingsButton: S.current.msg_config_biometrics,
            ),
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true);
      } else {
        Helpers.showToast(S.current.msg_no_biometrics);
      }
    } else {
      Helpers.showToast(S.current.msg_no_support_biometrics);
    }

    if (res) {
      Navigator.pushReplacementNamed(context, RoutesKeys.homePage);
    }
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      Helpers.showToast(S.current.msg_exit1);
      return Future.value(false);
    }
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: S.current.exit,
      desc: S.current.msg_exit,
      btnCancelText: S.current.no,
      btnCancelOnPress: () {},
      btnOkText: S.current.yes,
      btnOkOnPress: () async {
        exit(0);
      },
    ).show();
    return Future.value(false);
  }
}
