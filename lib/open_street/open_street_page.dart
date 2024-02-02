import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetPage extends StatefulWidget {
  OpenStreetPage({super.key});

  @override
  State<OpenStreetPage> createState() => _OpenStreetPageState();
}

class _OpenStreetPageState extends State<OpenStreetPage> {
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Example Open Street',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                initialCenter: LatLng(-6.921744, 107.607086),
                initialZoom: 18,
                onLongPress: (tapPosition, point) {
                  setState(() {
                    // markers.isNotEmpty
                  });
                }),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
