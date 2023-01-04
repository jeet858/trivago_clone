import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trivago_clone/models/hotels.dart';
import '../models/datetime.dart';
import '../models/guests.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<Marker> markers = [];
  late Position pos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Location',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${Provider.of<DateData>(context, listen: true).list[0]} ${months[DateTime.now().month - 1]} - "
              "${Provider.of<DateData>(context, listen: true).list[1]} ${months[DateTime.now().month - 1]}       "
              "${Provider.of<Guests>(context, listen: true).guests[0]} guests, "
              "${Provider.of<Guests>(context, listen: true).guests[2]} room",
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.080550, 79.396240),
              zoom: 14,
            ),
            onMapCreated: (controller) async {
              pos = await _determinePosition();
              GoogleMapController _googleMapController = controller;
              setState(() {
                _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(pos.latitude, pos.longitude),
                      zoom: 14,
                    ),
                  ),
                );
              });
            },
            markers: markers.toSet(),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.transparent,
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<HotelData>(context).hotels.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Hotels(
                    lat: Provider.of<HotelData>(context).hotels[index].lat,
                    lng: Provider.of<HotelData>(context).hotels[index].lng,
                    isFav: Provider.of<HotelData>(context).hotels[index].isFav,
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
