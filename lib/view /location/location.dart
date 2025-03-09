// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:women_safty_app/common/colors.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({super.key});

  @override
  _LiveLocationScreenState createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  // final MapController mapController = MapController();

  final mapController = MapController();
  LocationData? _currentLocation;
  final Location _location = Location();
  bool _mapReady = false; // Track when the map is ready

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    // Check location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    // Fetch current location
    final currentLocation = await _location.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });

    // Move the map after ensuring it is ready
    if (_mapReady && _currentLocation != null) {
      mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        14.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Location",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgcolour,
      ),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                onMapReady: () {
                  setState(() {
                    _mapReady = true;
                  });
                  if (_currentLocation != null) {
                    mapController.move(
                      LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      ),
                      14.0,
                    );
                  }
                },
                onTap: (tapPosition, point) {
             
                  if (_currentLocation != null) {
                    mapController.move(
                      LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      ),
                      14.0,
                    );
                  } else {
                    mapController.move(
                      LatLng(0.0,
                          0.0), 
                      14.0,
                    );
                  }
                },
                minZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=f08d823160a2416dbbf70d037a08ecc8',
                  subdomains: const ['a', 'b', 'c'],
                ),
                if (_currentLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(
                          _currentLocation!.latitude!,
                          _currentLocation!.longitude!,
                        ),
                        child: Image.asset("assets/marker.png"),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}
