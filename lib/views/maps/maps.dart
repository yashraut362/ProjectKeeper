import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController myController;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  Location _location = Location();

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
    _location.onLocationChanged.listen((l) {
      myController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Look for Nearby Mentor"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition:
                CameraPosition(target: _initialcameraposition, zoom: 12),
          ),
        ],
      ),
    );
  }
}
