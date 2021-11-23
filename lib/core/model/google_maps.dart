import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatelessWidget {
  GoogleMaps({Key? key}) : super(key: key);

  late GoogleMapController mapController;
  final LatLng _center = LatLng(38.68138271203498, 39.1961721009391);
  List<Marker> _markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    _markers.add(Marker(
        draggable: true,
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId('TekFak'),
        position: LatLng(38.68152553918184, 39.19611711322223),
        infoWindow: InfoWindow(title: 'Teknoloji Fakültesi')));
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
      mapToolbarEnabled: true,
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers),
    );
  }
}
