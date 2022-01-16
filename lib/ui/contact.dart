import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email =  TextEditingController();
  TextEditingController _object =  TextEditingController();
  TextEditingController _msg =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height / 3, start: 10, end: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Wrap(
                  spacing: 13,
                  runSpacing: 13,
                  children: [
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);
                        if (value!.isEmpty || !regex.hasMatch(value)) {
                          return S.current.msg_valid_mail;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: S.current.email,
                        prefixIcon: const Icon(
                          CupertinoIcons.at,
                          color: Colors.blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _object,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.msg_valid_text;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: S.current.object,
                        prefixIcon: const Icon(
                          CupertinoIcons.scribble,
                          color: Colors.blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _msg,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.msg_required_field;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: S.current.message,
                        alignLabelWithHint: true,
                        hintText: S.current.msg_your_text,
                        prefixIcon: const Icon(
                          CupertinoIcons.text_justify,
                          color: Colors.blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Helpers.showToast(S.current.success);
                      sendemail() ;
                    } else {
                      Helpers.showToast(S.current.msg_required_field);
                    }
                  },
                  child: Center(
                      child: Text(
                        S.current.send.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.pink.shade200,
                        offset: Offset(1, -2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.pink.shade200,
                        offset: Offset(-1, 2),
                        blurRadius: 5)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
  void sendemail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'slimani.abderrahim@gatechdz.com',
      query: encodeQueryParameters(<String, String>{
        'object' : _object.text ,
        'subject': _msg.text
      }),
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(
        emailLaunchUri.toString(),
      );
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
