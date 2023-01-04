import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivago_clone/models/guests.dart';

class GuestPicker extends StatefulWidget {
  @override
  _GuestPickerState createState() => _GuestPickerState();
}

class _GuestPickerState extends State<GuestPicker> {
  int _adultCount = 2;
  int _childCount = 0;
  int _roomCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Adults'),
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _adultCount > 0
                              ? () => setState(() => _adultCount--)
                              : null;
                          Provider.of<Guests>(context, listen: false)
                              .updateAdults(_adultCount);
                        }),
                    Text('$_adultCount'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() => _adultCount++);
                        Provider.of<Guests>(context, listen: false)
                            .updateAdults(_adultCount);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Child'),
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _childCount > 0
                              ? () => setState(() => _childCount--)
                              : null;
                          Provider.of<Guests>(context, listen: false)
                              .updateChild(_childCount);
                        }),
                    Text('$_childCount'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() => _childCount++);
                        Provider.of<Guests>(context, listen: false)
                            .updateChild(_childCount);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rooms'),
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _roomCount > 0
                              ? () => setState(() => _roomCount--)
                              : null;
                          Provider.of<Guests>(context, listen: false)
                              .updateRoom(_roomCount);
                        }),
                    Text('$_roomCount'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() => _roomCount++);
                        Provider.of<Guests>(context, listen: false)
                            .updateRoom(_roomCount);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Material(
              elevation: 5.0,
              color: const Color(0xff004aad),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minWidth: double.infinity,
                height: 42.0,
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
