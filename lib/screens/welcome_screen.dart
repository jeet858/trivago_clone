import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivago_clone/screens/favs.dart';
import 'package:trivago_clone/screens/guestselector.dart';
import 'package:trivago_clone/screens/settings.dart';

import '../models/datetime.dart';
import '../models/guests.dart';
import 'calender.dart';
import 'login.dart';
import 'mapscreen.dart';

class WelcomeSreen extends StatefulWidget {
  @override
  State<WelcomeSreen> createState() => _WelcomeSreenState();
}

class _WelcomeSreenState extends State<WelcomeSreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xffd9d9d9),
        child: Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: null,
                child: Column(
                  children: const [
                    Icon(Icons.hotel, color: Colors.blue),
                    Text('Stays', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              TextButton(
                child: Column(
                  children: const [
                    Icon(Icons.favorite, color: Colors.black),
                    Text('Favourites', style: TextStyle(color: Colors.black))
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Favourites()));
                },
              ),
              TextButton(
                child: Column(
                  children: const [
                    Icon(Icons.settings, color: Colors.black),
                    Text('Settings', style: TextStyle(color: Colors.black))
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('asset/images/trivago_clone.png'),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Destination',
                    style: TextStyle(color: Color(0xffa6a6a6)),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffd9d9d9),
                      filled: true,
                      hintText: 'Goa',
                      hintStyle: TextStyle(
                        color: Color(0xffa6a6a6),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: DateSelector(),
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Dates",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffa6a6a6)),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${Provider.of<DateData>(context, listen: true).list[0]} ${months[DateTime.now().month - 1]}- "
                                "${Provider.of<DateData>(context, listen: true).list[1]} ${months[DateTime.now().month - 1]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: GuestPicker(),
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rooms',
                                style: TextStyle(color: Color(0xffa6a6a6)),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${Provider.of<Guests>(context).guests[0]} guests, "
                                "${Provider.of<Guests>(context).guests[2]} room",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff004aad)),
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Looking for a hotel nearby tonight?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, bottom: 20, top: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      alignment: Alignment.center,
                      'asset/images/maps.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.map_sharp,
                                color: Colors.white, size: 50),
                            Text(
                              'Current Location',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        Text(
                          "${Provider.of<DateData>(context, listen: true).list[0]} ${months[DateTime.now().month - 1]} - "
                          "${Provider.of<DateData>(context, listen: true).list[1]} ${months[DateTime.now().month - 1]}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Material(
                          elevation: 5.0,
                          color: const Color(0xff004aad),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapScreen()));
                            },
                            minWidth: double.infinity,
                            height: 42.0,
                            child: const Text(
                              'Search Nearby Hotels',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      alignment: Alignment.center,
                      'asset/images/login.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.map_sharp,
                                color: Colors.white, size: 45),
                            Text(
                              'Rest easy. We got you.',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        const Text(
                          "2 geusts, 1 room",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        const Material(
                          elevation: 5.0,
                          color: Color(0xff004aad),
                          child: MaterialButton(
                            onPressed: null,
                            minWidth: double.infinity,
                            height: 42.0,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
