import 'package:dhakay/generated/l10n.dart';
import 'package:dragablegridview_flutter/dragablegridviewbin.dart';

const String homeItemSmartCityId = "homeItemSmartCityId";
const String homeItemSonelgazId = "homeItemSonelgazId";
const String homeItemAdeId = "homeItemAdeId";
const String homeItemEnergieId = "homeItemEnergieId";

class HomeItemModel extends DragAbleGridViewBin{
  String  id ;
  String title;
  String image ;

  HomeItemModel({required this.id, required this.title, required this.image});
}

HomeItemModel homeItemSmartcity = HomeItemModel(
    id: homeItemSmartCityId,
    title: S.current.smartcity,
    image: "assets/smart.png");
HomeItemModel homeItemSonelgaz = HomeItemModel(
    id: homeItemSonelgazId,
    title: S.current.sonelgaz,
    image: "assets/sonelgaz.png");
HomeItemModel homeItemAde = HomeItemModel(
    id: homeItemAdeId,
    title: S.current.ade,
    image: "assets/ade.png");
HomeItemModel homeItemEnergie = HomeItemModel(
    id: homeItemEnergieId,
    title: S.current.energieverte,
    image: "assets/energieverte.png");


