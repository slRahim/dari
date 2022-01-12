import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// special pour l'ajout et modification de pin d'auth ds le screen profile
class EnterPin extends StatefulWidget {
  final Function(String newCodePin) onCodePinChanged;
  final String codePin;

  EnterPin(this.onCodePinChanged, this.codePin);

  @override
  _EnterPinState createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
          ),
          child: OtpSceern(widget.onCodePinChanged),
        ),
      ),
    );
  }
}

class OtpSceern extends StatefulWidget {
  final Function(String newCodePin) onCodePinChanged;

  OtpSceern(this.onCodePinChanged);

  @override
  _OtpSceernState createState() => _OtpSceernState();
}

class _OtpSceernState extends State<OtpSceern> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  String? fisrt;

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.white30),
  );
  int pinIndex = 0;

  @override
  void initState() {
    super.initState();
    fisrt = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Icon(
            CupertinoIcons.lock,
            color: Colors.white,
            size: 80,
          ),
          Expanded(
            child: Container(
              alignment: Alignment(0, 0.4),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecuritytext(),
                  SizedBox(
                    height: 20,
                  ),
                  buildPinRow(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    }),
                KeyboardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    }),
                KeyboardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    }),
                KeyboardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    }),
                KeyboardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    }),
                KeyboardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    }),
                KeyboardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60.0,
                  child: MaterialButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                ),
                KeyboardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    }),
                Container(
                  width: 60,
                  child: MaterialButton(
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                    onPressed: () {
                      clearPin();
                    },
                    child: Icon(
                      CupertinoIcons.delete_left,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  pinIndexSetup(String text) async {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) {
      if (fisrt == "") {
        fisrt = strPin;
        pinIndex = 0;
        pinOneController.clear();
        pinTwoController.clear();
        pinThreeController.clear();
        pinFourController.clear();
      } else {
        String message;
        if (fisrt == strPin) {
          widget.onCodePinChanged(strPin);
          message = S.current.msg_pincode_save;
        } else {
          message = "S.current.msg_pass_incorrecte";
        }
        Helpers.showToast(message);

        fisrt = "";
        pinIndex = 0;
        pinOneController.clear();
        pinTwoController.clear();
        pinThreeController.clear();
        pinFourController.clear();
      }
    }
    setState(() {});
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PinNumber(
          textEditController: pinOneController,
        ),
        PinNumber(
          textEditController: pinTwoController,
        ),
        PinNumber(
          textEditController: pinThreeController,
        ),
        PinNumber(
          textEditController: pinFourController,
        ),
      ],
    );
  }

  Widget buildSecuritytext() {
    return Column(
      children: <Widget>[
        Text(
          fisrt == "" ? S.current.enter_pin_code : S.current.confirm_pin_code,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(S.current.msg_secure_app,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}

class PinNumber extends StatelessWidget {
  final TextEditingController? textEditController;

  PinNumber({this.textEditController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      child: TextField(
        controller: textEditController,
        style: TextStyle(fontSize: 60, color: Colors.white),
        enabled: false,
        obscureText: true,
        obscuringCharacter: "•",
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "∘",
            hintStyle: TextStyle(fontSize: 50, color: Colors.white)),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int? n;
  final Function()? onPressed;

  KeyboardNumber({this.n, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 1,
          color: Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        height: 70.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
