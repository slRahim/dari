import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
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
}
