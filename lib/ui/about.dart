import 'package:dari/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height / 3, start: 10, end: 10),
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(S.current.our_mission, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("  ${S.current.electrical} " , textAlign: TextAlign.start, style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("  ${S.current.instrumentation}" , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("  ${S.current.automation}" , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("  ${S.current.electronic_maintenance} " , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("  ${S.current.d_scaning}" , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),

           const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.generale , style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.founded , textAlign: TextAlign.start, style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.company_size , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.company_address , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.company_field , style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(S.current.contact , style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(CupertinoIcons.phone),
                Text(" 000-000-000-000" , textAlign: TextAlign.start, style: TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.article_outlined),
                Text(" 023-589-900" , textAlign: TextAlign.start, style: TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(CupertinoIcons.globe),
                Text(" gatech.amenhyd.com" , textAlign: TextAlign.start, style: TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
