import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:dari/helpers/statics.dart';
import 'package:dari/widget/blue700clipper.dart';
import 'package:dari/widget/home_item_model.dart';
import 'package:dari/widget/home_item_widget.dart';
import 'package:dari/widget/pinkclipper.dart';
import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:map_launcher/map_launcher.dart';
import 'package:map_launcher/src/models.dart' as coord;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  DateTime? currentBackPressTime;

  List<HomeItemModel> homeItemsModels = [
    homeItemSonatrach,
    homeItemSonelgaz,
    homeItemAde,
    homeItemVitalCheck
  ];

  var editSwitchController = EditSwitchController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  Widget homeTab(context) {
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
                    "GLOBAL ALGERIAN \n TECHNOLOGY",
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
          Container(
            margin: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height / 3,
                start: 10,
                end: 10),
            child: DragAbleGridView(
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: 2,
              itemBins: homeItemsModels,
              editSwitchController: editSwitchController,
              isOpenDragAble: true,
              animationDuration: 300,
              //milliseconds
              longPressDuration: 800,
              //milliseconds
              child: (int position) {
                return HomeItemWidget(homeItemModel : homeItemsModels[position]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget aboutTab() {
    return Container(
      color: Colors.red,
    );
  }

  Widget mapTab() {
    return FlutterMap(
      options: MapOptions(
        zoom: 10,
        center: latLng.LatLng(36.7392115, 2.9992437),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              point: latLng.LatLng(36.669452990903416, 3.051860970196347),
              builder: (ctx) => Container(
                child: Icon(
                  CupertinoIcons.pin_fill,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget contactTab() {
    return Container(
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButton: (_currentIndex == 2)
            ? FloatingActionButton(
                onPressed: () async {
                  Helpers.openMapsSheet(context,
                      coord.Coords(36.66944438536644, 3.0517858683443597));
                },
                child: Icon(CupertinoIcons.arrow_turn_up_left),
              )
            : null,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            homeTab(context),
            aboutTab(),
            mapTab(),
            contactTab(),
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home'), icon: Icon(CupertinoIcons.house_alt)),
            BottomNavyBarItem(
                title: Text('About us'), icon: Icon(CupertinoIcons.book)),
            BottomNavyBarItem(
                title: Text('Map'), icon: Icon(CupertinoIcons.map)),
            BottomNavyBarItem(
                title: Text('Contact us'), icon: Icon(CupertinoIcons.mail)),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();

    //  if (GridHomeWidget.Global_Draggable_Mode &&
    //     _currentHomeState != null &&
    //     (_currentHomeState is HomeLoaded || _currentHomeState is HomeInitial)) {
    //   return Future.value(true);
    // } else {
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 3)) {
      currentBackPressTime = now;
      Helpers.showToast("S.current.msg_quitter1");
      return Future.value(false);
    }
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: "quitter",
      desc: "msg_quitter",
      btnCancelText: "non",
      btnCancelOnPress: () {},
      btnOkText: "oui",
      btnOkOnPress: () async {
        exit(0);
      },
    )..show();
    return Future.value(false);
  }
}
