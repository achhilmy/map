import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPages extends StatefulWidget {
  const GoogleMapsPages({super.key});

  @override
  State<GoogleMapsPages> createState() => _GoogleMapsPagesState();
}

class _GoogleMapsPagesState extends State<GoogleMapsPages> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Google Maps Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco, CA
          zoom: 6,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          // Tambahkan marker ke peta saat peta sudah dibuat
          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId('1'),
                position: LatLng(37.7749, -122.4194),
                onTap: () {
                  // Handler untuk menampilkan info window saat marker di-klik
                  _showInfoWindow();
                },
              ),
            );
          });
        },
      ),
    );
  }

  // Method untuk menampilkan info window
  void _showInfoWindow() {
    _controller?.showMarkerInfoWindow(MarkerId('1'));
  }
}
