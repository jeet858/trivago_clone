import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hotels extends StatelessWidget {
  int lat = 0;
  int lng = 0;
  bool isFav = false;
  int index = 0;
  Hotels({required lat, required lng, required isFav, required index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Hotel'),
          IconButton(
            onPressed: () {
              Provider.of<HotelData>(context, listen: false).updateFav(index);
              isFav = !isFav;
            },
            color: isFav ? Colors.red : Colors.black,
            icon: const Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
    );
  }
}

class HotelData with ChangeNotifier {
  List<Hotels> hotels = [
    Hotels(
      lat: 10,
      lng: 10,
      isFav: false,
      index: 0,
    ),
    Hotels(
      lat: 10,
      lng: 10,
      isFav: false,
      index: 1,
    ),
    Hotels(
      lat: 10,
      lng: 10,
      isFav: false,
      index: 2,
    ),
  ];
  void updateFav(int index) {
    hotels[index].isFav = !hotels[index].isFav;
    notifyListeners();
  }
}
