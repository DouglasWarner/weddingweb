import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../base/BaseState.dart';
import '../model/MyLocation.dart';

class MyGoogleMap extends StatefulWidget {
  MyLocation location;

  MyGoogleMap(this.location, {super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMap();
}

class _MyGoogleMap extends BaseState<MyGoogleMap> {
  late GoogleMapController mapsController;
  bool showMaps = true;

  @override
  Widget build(BuildContext context) {
    init(context);

    return Padding(padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets, child:
      showMaps ?
          Container(
            height: 500,
            width: responsiveApp.setWidth(700),
            padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: GoogleMap(
              rotateGesturesEnabled: false,
              compassEnabled: false,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(target: LatLng(widget.location.lat, widget.location.lng), zoom: 15),
              onMapCreated: (controller) {
                setState(() {
                  mapsController = controller;
                });
              },
              markers: {
                  Marker(
                      position: LatLng(widget.location.lat, widget.location.lng),
                      markerId: MarkerId("Position")
                  )
              },
              mapType: MapType.normal,
            ),
          )
      : CircularProgressIndicator(),
    );
  }

}