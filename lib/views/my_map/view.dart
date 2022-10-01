// import 'package:flutter/material.dart';
//
// class MyMapView extends StatelessWidget {
//   const MyMapView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ,
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> myMarkers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        circles: {
          Circle(
              circleId: CircleId("das"),
              center: LatLng(31.0446859, 31.3653693),
              fillColor: Colors.red.withOpacity(.5),
              strokeWidth: 0,
              radius: 2000)
        },
        onTap: (argument) {
          myMarkers.add(
            Marker(markerId: MarkerId("g"), position: argument),
          );
          setState(() {});
        },
        markers: myMarkers,
        initialCameraPosition: CameraPosition(
          target: LatLng(31.0446859, 31.3653693),
          zoom: 15.1,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the Markaz!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(30.74697, 31.2492481), zoom: 19.151926040649414)));
  }
}
