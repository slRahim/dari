import 'package:dari/helpers/statics.dart';
import 'package:dari/widget/home_item_model.dart';
import 'package:flutter/material.dart';

class HomeItemWidget extends StatefulWidget {
  final HomeItemModel homeItemModel ;
  const HomeItemWidget({Key? key , required this.homeItemModel}) : super(key: key);

  @override
  _HomeItemWidgetState createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {

  Color _containerColor = Colors.white ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, RoutesKeys.listItems);
      },
      child: Container(
        width: 170,
        height: 170,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        //Because this layout and the delete_Icon are in the same Stack, setting marginTop and marginRight will make the icon in the proper position.
        margin: EdgeInsets.only(top: 6.0, right: 6.0),
        child: Column(
          children: [
            Image.asset(
              widget.homeItemModel.image,
              width: 100, height: 100,
            ),
            SizedBox(height: 15,),
            Text(
              widget.homeItemModel.title,
              style: TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

