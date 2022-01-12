import 'package:dari/generated/l10n.dart';
import 'package:dari/widget/home_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ListingPage extends StatefulWidget {
  final argument ;
  const ListingPage({Key? key ,  required this.argument}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();

  late HomeItemModel item ;

  @override
  void initState() {
    item = widget.argument ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8FA),
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back , color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: _cardItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _cardItems(){
    List<Widget> list = [] ;

    //epayment card
    if(item.id == homeItemAdeId || item.id == homeItemSonelgazId){
      switch (item.id){
        case homeItemAdeId :
          list.add(
            SimpleFoldingCell.create(
              key: _foldingCellKey,
              frontWidget: _buildFrontWidget(_foldingCellKey , "assets/epayment.png", S.current.epayment_portal , "https://fatourati.seaal.dz/"),
              innerWidget: _buildInnerWidget(_foldingCellKey, "assets/epayment.png", S.current.details, S.current.details_ade1 , "https://fatourati.seaal.dz/"),
              cellSize: Size(MediaQuery.of(context).size.width, 140),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 5,
            ),
          );
          break;
        case homeItemSonelgazId :
          list.add(
            SimpleFoldingCell.create(
              key: _foldingCellKey,
              frontWidget: _buildFrontWidget(_foldingCellKey , "assets/epayment.png", S.current.epayment_portal , "https://baridinet.poste.dz/sonelgaz"),
              innerWidget: _buildInnerWidget(_foldingCellKey, "assets/epayment.png", S.current.details, S.current.details_sonelgaz1 , "https://baridinet.poste.dz/sonelgaz"),
              cellSize: Size(MediaQuery.of(context).size.width, 140),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 5,
            ),
          );
          break;
      }

    }


    //entreprise card
    switch (item.id){
      case homeItemAdeId :
        list.add(
          SimpleFoldingCell.create(
            key: _foldingCellKey1,
            frontWidget: _buildFrontWidget(_foldingCellKey1 , "assets/iot-banner.png" , S.current.water_monitoring , "http://gatech.amenhyd.com:1881/ui"),
            innerWidget: _buildInnerWidget(_foldingCellKey1,  "assets/iot-banner.png" , S.current.details , S.current.details_ade2 , "http://gatech.amenhyd.com:1881/ui"),
            cellSize: Size(MediaQuery.of(context).size.width, 140),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 5,
          ),
        );
        break;
      case homeItemSonelgazId :
        list.add(
          SimpleFoldingCell.create(
            key: _foldingCellKey1,
            frontWidget: _buildFrontWidget(_foldingCellKey1 , "assets/iot-banner.png" , S.current.gas_monitoring,"http://gatech.amenhyd.com:1880/ui"),
            innerWidget: _buildInnerWidget(_foldingCellKey1,  "assets/iot-banner.png" , S.current.details , S.current.details_sonelgaz2,"http://gatech.amenhyd.com:1880/ui"),
            cellSize: Size(MediaQuery.of(context).size.width, 140),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 5,
          ),
        );
        break;
      case homeItemSonatrachId :
        list.add(
          SimpleFoldingCell.create(
            key: _foldingCellKey1,
            frontWidget: _buildFrontWidget(_foldingCellKey1 , "assets/iot-banner.png" , S.current.gas_well_monitoring,"http://gatech.amenhyd.com:1880/ui"),
            innerWidget: _buildInnerWidget(_foldingCellKey1,  "assets/iot-banner.png" , S.current.details , S.current.details_sonatrach2,"http://gatech.amenhyd.com:1880/ui"),
            cellSize: Size(MediaQuery.of(context).size.width, 140),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 5,
          ),
        );
        break;
      case homeItemVitalCheckId :
        list.add(
          SimpleFoldingCell.create(
            key: _foldingCellKey1,
            frontWidget: _buildFrontWidget(_foldingCellKey1 , "assets/iot-banner.png" , S.current.glucose_monitoring,""),
            innerWidget: _buildInnerWidget(_foldingCellKey1,  "assets/iot-banner.png" , S.current.details , S.current.details_glucose2,""),
            cellSize: Size(MediaQuery.of(context).size.width, 140),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 5,
          ),
        );
        break;
    }

    return list ;
  }

  Widget _buildFrontWidget(_key ,String imagesrc , String title , String url) {
    return InkWell(
      onTap: (){
          urlLauncher(url);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagesrc),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
          ),
        ),
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.4),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => _key.currentState?.toggleFold(),
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                  ),
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInnerWidget(_key , String imagesrc , String title , String content , String url) {
    return InkWell(
      onTap: (){
         urlLauncher(url);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagesrc),
            fit: BoxFit.cover,
            colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => _key.currentState?.toggleFold(),
                  icon: const Icon(
                    CupertinoIcons.chevron_up,
                  ),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void urlLauncher(url)async{
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
