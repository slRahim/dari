import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class ListingPage extends StatefulWidget {
  final String? title ;
  const ListingPage({Key? key ,  this.title}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8FA),
      appBar: AppBar(
        title: Text("Sonatrach"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SimpleFoldingCell.create(
                key: _foldingCellKey,
                frontWidget: _buildFrontWidget(_foldingCellKey , "assets/epayment.png"),
                innerWidget: _buildInnerWidget(_foldingCellKey, "assets/epayment.png"),
                cellSize: Size(MediaQuery.of(context).size.width, 140),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 5,
              ),
              SimpleFoldingCell.create(
                key: _foldingCellKey1,
                frontWidget: _buildFrontWidget(_foldingCellKey1 , "assets/iot-banner.png"),
                innerWidget: _buildInnerWidget(_foldingCellKey1,  "assets/iot-banner.png"),
                cellSize: Size(MediaQuery.of(context).size.width, 140),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontWidget(_key ,String imagesrc) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagesrc),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Text(
              "CARD TITLE",
              style: TextStyle(
                color: Color(0xFF2e282a),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _key.currentState?.toggleFold(),
              child: const Text(
                "Details",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInnerWidget(_key , String imagesrc) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagesrc),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
        ),
      ),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "CARD TITLE",
              style: TextStyle(
                color: Color(0xFF2e282a),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "CARD DETAIL",
              style: TextStyle(
                color: Color(0xFF2e282a),
                fontSize: 40.0,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _key.currentState?.toggleFold(),
              child: Text(
                "Close",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
