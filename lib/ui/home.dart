import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dari/helpers/helpers.dart';
import 'package:dari/helpers/statics.dart';
import 'package:dari/widget/blue700clipper.dart';
import 'package:dari/widget/home_app_bar.dart';
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

  final _formKey = GlobalKey<FormState>();

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
    return HomeAppBar(
      child: Container(
        margin: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height / 3, start: 10, end: 10),
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
            return HomeItemWidget(homeItemModel: homeItemsModels[position]);
          },
        ),
      ),
    );
  }

  Widget contactTab(context) {
    return HomeAppBar(
      child: Container(
        margin: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height / 3, start: 10, end: 10),
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
                        labelText: "Your Mail",
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

  Widget mapTab(context) {
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

  Widget aboutTab(context) {
    return HomeAppBar(
      child: SingleChildScrollView(
        child: Container(
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
        ),
      ),
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
            contactTab(context),
            mapTab(context),
            aboutTab(context),
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
                title: Text('Contact us'), icon: Icon(CupertinoIcons.mail)),
            BottomNavyBarItem(
                title: Text('Map'), icon: Icon(CupertinoIcons.map)),
            BottomNavyBarItem(
                title: Text('About us'), icon: Icon(CupertinoIcons.book)),
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
