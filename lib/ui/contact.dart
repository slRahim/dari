import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

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
                      // controller: _refControl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);
                        if (value!.isEmpty || !regex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "${S.current.dark_them}",
                        prefixIcon: Icon(
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
                      // controller: _refControl,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Object",
                        prefixIcon: Icon(
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
                      // controller: _refControl,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "S.current.msg_champ_oblg";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Message",
                        alignLabelWithHint: true,
                        hintText: "Your text here !",
                        prefixIcon: Icon(
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Helpers.showToast("success");
                    } else {
                      Helpers.showToast("{S.current.msg_champs_obg}");
                    }
                  },
                  child: Center(
                      child: Text(
                        "send".toUpperCase(),
                        style: TextStyle(
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
}
