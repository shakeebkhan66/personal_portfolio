import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  // ToDo Instance of GoogleMap
  final Completer<GoogleMapController> _controller = Completer();

  // ToDo Default InitialCameraPosition
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.6844, 73.0645),
    zoom: 14,
  );

  // ToDo Creating Markers List To Show Markers on GoogleMap
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(
          title: "The title of the marker",
        ))
  ];

  // Future Function To Get User Current Location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          getUserCurrentLocation().then((value) async{
            print("My Current Location");
            print(value.latitude.toString() + " " + value.longitude.toString());
            _markers.add(Marker(
                markerId: const MarkerId("2"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(title: "My Current Location")));
            CameraPosition myCameraPosition =
                CameraPosition(
                  zoom: 14,
                    target: LatLng(value.latitude, value.longitude));
            final GoogleMapController controller = await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(myCameraPosition));
            setState(() {

            });
          });
        },
        child: const Icon(
          Icons.location_on,
          color: Colors.white70,
        ),
      ),
    );
  }
}
