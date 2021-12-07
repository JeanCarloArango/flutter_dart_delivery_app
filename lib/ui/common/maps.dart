import 'dart:async';

import 'package:delivery_app/model/bussiness.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  final Bussiness _bussiness;

  Maps(this._bussiness);

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final cor = LatLng(
      double.parse(widget._bussiness.latitude),
      double.parse(widget._bussiness.longitude),
    );

    final CameraPosition _kGooglePlex = CameraPosition(
      target: cor,
      zoom: 14.4746,
    );
    return GoogleMap(
      mapType: MapType.satellite,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
