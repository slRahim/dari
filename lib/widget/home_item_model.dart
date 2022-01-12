import 'package:dari/generated/l10n.dart';
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

HomeItemModel homeItemSonatrach = HomeItemModel(
    id: homeItemSonatrachId,
    title: S.current.sonatrach,
    image: "assets/sonatrach.png");
HomeItemModel homeItemSonelgaz = HomeItemModel(
    id: homeItemSonelgazId,
    title: S.current.sonelgaz,
    image: "assets/sonelgaz.png");
HomeItemModel homeItemAde = HomeItemModel(
    id: homeItemAdeId,
    title: S.current.ade,
    image: "assets/ade.png");
HomeItemModel homeItemVitalCheck = HomeItemModel(
    id: homeItemVitalCheckId,
    title: S.current.vitalcheck,
    image: "assets/glucometer.png");


