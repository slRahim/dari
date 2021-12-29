import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height / 3, start: 10, end: 10),
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Our Mission" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("  Electrical " , textAlign: TextAlign.start, style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("  instrumentation" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("  Automation" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("  Electronic maintenance " , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("  3D scanning" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Generale" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Founded 2019" , textAlign: TextAlign.start, style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Company size 51-200 employees" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Zone D'Activité baba ali Shaoula,Alger" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Usine de production" , style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Contact" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.phone),
              Text(" 000-000-000-000" , textAlign: TextAlign.start, style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.article_outlined),
              Text(" 000-000-000-000" , textAlign: TextAlign.start, style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.globe),
              Text(" gatech.amenhyd.com" , textAlign: TextAlign.start, style: TextStyle(
                fontSize: 16,
              ),),
            ],
          ),

        ],
      ),
    );
  }
}
