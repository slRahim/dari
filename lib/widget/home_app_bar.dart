import 'package:dari/generated/l10n.dart';
import 'package:dari/helpers/statics.dart';
import 'package:dari/widget/pinkclipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blue700clipper.dart';

class HomeAppBar extends StatelessWidget {
  final Widget child ;
  const HomeAppBar({Key? key , required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipPath(
            clipper: PinkClipper(),
            child: Container(
              color: Colors.pink.withOpacity(0.7),
            ),
          ),
          ClipPath(
            clipper: BlueClipper(),
            child: Container(
              color: Colors.blue[700],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 40),
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: (MediaQuery.of(context).orientation ==
                      Orientation.landscape)
                      ? EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 50)
                      : EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15),
                  child: Text(
                    S.current.company_name1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesKeys.settingsPage);
                    },
                    icon: Icon(
                      CupertinoIcons.settings,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),

          child
        ],
      ),
    );
  }
}
