import 'package:dragablegridview_flutter/dragablegridviewbin.dart';

const String homeItemSonatrachId = "homeItemSonatrachId";
const String homeItemSonelgazId = "homeItemSonelgazId";
const String homeItemAdeId = "homeItemAdeId";
const String homeItemVitalCheckId = "homeItemVitalCheckId";

class HomeItemModel extends DragAbleGridViewBin{
  String  id ;
  String title;
  String image ;

  HomeItemModel({required this.id, required this.title, required this.image});
}

HomeItemModel homeItemSonatrach = new HomeItemModel(
    id: homeItemSonatrachId,
    title: "Sonatrach",
    image: "assets/sonatrach.png");
HomeItemModel homeItemSonelgaz = new HomeItemModel(
    id: homeItemSonelgazId,
    title: "Sonelgaz",
    image: "assets/sonelgaz.png");
HomeItemModel homeItemAde = new HomeItemModel(
    id: homeItemAdeId,
    title: "Ade",
    image: "assets/ade.png");
HomeItemModel homeItemVitalCheck = new HomeItemModel(
    id: homeItemVitalCheckId,
    title: "VitalChekc",
    image: "assets/glucometer.png");

