import 'package:draggable_home/draggable_home.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class ListingPage extends StatefulWidget {
  final String? title ;
  const ListingPage({Key? key ,  this.title}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: Icon(Icons.arrow_back_ios , color: Colors.white,),
      title: Text("Draggable Home"),
      headerWidget: headerWidget(context),
      headerExpandedHeight: 0.4,
      body: [
        listView(),
      ],
      fullyStretchable: true,
    );
  }


  Container headerWidget(BuildContext context) => Container(
    color: Colors.black54,
    child: Center(
      child: Image.asset("assets/sonatrach.png" , width: 150, height: 150,),
    ),
  );

  Widget listView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: ExpansionCard(
              borderRadius: 30,
              backgroundColor: Colors.pink,
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Header",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Sub",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  child: Text("Content goes over here !",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
