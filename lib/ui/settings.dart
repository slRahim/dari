import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:dari/helpers/statics.dart';
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
  SharedPreferences ?_prefs;

  String ?_language;
  bool _darkMode = false ;
  bool _lockscreen  = false ;


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

  futureInit() async{
    _prefs = await SharedPreferences.getInstance();
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
          _darkMode = false;;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_finishedLoading) {
      return Scaffold(body: Helpers.buildLoading());
    }
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back  , color: Colors.blue,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(CupertinoIcons.checkmark,color: Colors.blue,))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.globe,
                iconStyle: IconStyle(),
                title: 'Language',
                subtitle: "English",
              ),
              SettingsItem(
                onTap: () {},
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
                subtitle:_lockscreen ? "On" : "Off",
                trailing: CupertinoSwitch(
                  value: _lockscreen,
                  onChanged: (value) {
                    setState(() {
                      _lockscreen = value ;
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
                subtitle: (_darkMode)? "Dark" :  "Light",
                trailing: CupertinoSwitch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value ;
                    });
                  },
                ),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {

                },
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
    );
  }


}
