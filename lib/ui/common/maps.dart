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
    print(widget._bussiness.latitude);
    print(widget._bussiness.longitude);
    final cor = LatLng(
      double.parse(widget._bussiness.latitude.trim()),
      double.parse(widget._bussiness.longitude.trim()),
    );

    final CameraPosition cp = CameraPosition(
      target: cor,
      // target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 20,
    );

    final mk = Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(widget._bussiness.name),
      position: cor,
      infoWindow: InfoWindow(
        title: widget._bussiness.name,
        snippet: widget._bussiness.type,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cp,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {mk},
    );
  }
}
