import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:dari/helpers/statics.dart';
import 'package:dari/widget/otpscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _finishedLoading = false;
  SharedPreferences? _prefs;

  String? _language;
  bool _darkMode = false;

  bool _lockscreen = false;
  String _codepin = "";

  @override
  void initState() {
    super.initState();
    _language = Statics.languages[0];
    futureInit().then((value) {
      setState(() {
        _finishedLoading = true;
      });
    });
  }

  futureInit() async {
    _prefs = await SharedPreferences.getInstance();
    String? res = _prefs!.getString("codepin");
    if (res != null && res.isNotEmpty) {
      _codepin = res;
    }
    switch (_prefs!.getString("myLocale")) {
      case ("en"):
        setState(() {
          _language = Statics.languages[0];
        });
        break;
      case ("fr"):
        setState(() {
          _language = Statics.languages[1];
        });
        break;
      case ("ar"):
        setState(() {
          _language = Statics.languages[2];
        });
        break;
      default:
        setState(() {
          _language = Statics.languages[0];
        });
        break;
    }
    switch (_prefs!.getString("myStyle")) {
      case ("light"):
        setState(() {
          _darkMode = false;
        });
        break;
      case ("dark"):
        setState(() {
          _darkMode = true;
        });
        break;
      default:
        setState(() {
          _darkMode = false;
          ;
        });
        break;
    }

    if (_prefs!.getInt("login") == 1) {
      setState(() {
        _lockscreen = true;
      });
    } else {
      _lockscreen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_finishedLoading) {
      return Scaffold(body: Helpers.buildLoading());
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.blue,
            ),
            onPressed: () {
              AwesomeDialog(
                  context: context,
                  title: "",
                  desc: "{S.current.msg_retour_no_save}",
                  dialogType: DialogType.QUESTION,
                  animType: AnimType.BOTTOMSLIDE,
                  btnCancelText: "non",
                  btnCancelOnPress: () {},
                  btnOkText: "oui",
                  btnOkOnPress: () async {
                    Navigator.pop(context);
                  })
                .show();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  AwesomeDialog(
                      context: context,
                      title: "{S.current.param_save}",
                      desc: "{S.current.param_msg_save}",
                      dialogType: DialogType.QUESTION,
                      animType: AnimType.BOTTOMSLIDE,
                      btnCancelText: "non",
                      btnCancelOnPress: () {
                        Navigator.pop(context);
                      },
                      btnOkText: "oui",
                      btnOkOnPress: () async {
                        await _savedata();
                      })
                    .show();
                },
                icon: Icon(
                  CupertinoIcons.checkmark,
                  color: Colors.blue,
                ))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () async {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.QUESTION,
                        animType: AnimType.BOTTOMSLIDE,
                        title: "{S.current.param_lang_title}",
                        body: _languageDialog(),
                        btnCancelText: "non",
                        btnCancelOnPress: () {},
                        btnOkText: "oui",
                        btnOkOnPress: () async {
                          setState(() {
                            _language;
                          });
                        })
                      .show();
                  },
                  icons: CupertinoIcons.globe,
                  iconStyle: IconStyle(),
                  title: 'Language',
                  subtitle: _language,
                ),
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return EnterPin(onCodePinChanged, _codepin);
                        });
                  },
                  icons: Icons.fingerprint,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Privacy',
                  subtitle: "Edit your password",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.lock_shield_fill,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.green,
                  ),
                  title: 'Lock screen',
                  subtitle: _lockscreen ? "On" : "Off",
                  trailing: CupertinoSwitch(
                    value: _lockscreen,
                    onChanged: (value) {
                      setState(() {
                        _lockscreen = value;
                      });
                    },
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.blue.shade900,
                  ),
                  title: 'Dark mode',
                  subtitle: (_darkMode) ? "Dark" : "Light",
                  trailing: CupertinoSwitch(
                    value: _darkMode,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.star,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    backgroundColor: Colors.yellow.shade700,
                  ),
                  title: 'Rate',
                  subtitle: "Leave your feedback",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Global Algerina Technology",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    AwesomeDialog(
        context: context,
        title: "",
        desc: "{S.current.msg_retour_no_save}",
        dialogType: DialogType.QUESTION,
        animType: AnimType.BOTTOMSLIDE,
        btnCancelText: "non",
        btnCancelOnPress: () {},
        btnOkText: "oui",
        btnOkOnPress: () async {
          Navigator.pop(context);
        })
      .show();
    return Future.value(true);
  }

  onCodePinChanged(String newCodePin) {
    Navigator.pop(context);
    print("code pin is ${_codepin}");
    setState(() {
      _codepin = newCodePin;
      _lockscreen = true;
    });
  }

  _languageDialog() {
    return StatefulBuilder(
        builder: (context, setState) => Wrap(
              children: [
                Container(
                  height: 180,
                  child: Column(
                    children: [
                      RadioListTile(
                        value: Statics.languages[0],
                        groupValue: _language,
                        title: const Text(
                          'English (ENG)',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _language = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        value: Statics.languages[1],
                        groupValue: _language,
                        title: const Text(
                          'Français (FR)',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _language = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        value: Statics.languages[2],
                        groupValue: _language,
                        title: const Text(
                          'عربية (AR)',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _language = value.toString();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

  Future<void> _savedata() async {
    if (_darkMode) {
      _prefs!.setString("myStyle", "dark");
    } else {
      _prefs!.setString("myStyle", "light");
    }

    if (_lockscreen) {
      _prefs!.setInt("login", 1);
    } else {
      _prefs!.setInt("login", 0);
    }
    _prefs!.setString("codepin", _codepin);

    switch (_language) {
      case ("English (ENG)"):
        _prefs!.setString("myLocale", "en");
        await S.load(Locale("en"));
        break;
      case ("Français (FR)"):
        _prefs!.setString("myLocale", "fr");
        await S.load(Locale("fr"));
        break;
      case ("عربية (AR)"):
        _prefs!.setString("myLocale", "ar");
        await S.load(Locale("ar_DZ"));
        break;
    }
    Navigator.pop(context);
  }
}
