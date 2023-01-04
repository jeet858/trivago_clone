import 'package:flutter/material.dart';
import 'package:trivago_clone/screens/welcome_screen.dart';

import 'favs.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeSreen()));
                },
                child: Column(
                  children: const [
                    Icon(Icons.hotel, color: Colors.black),
                    Text('Stays', style: TextStyle(color: Colors.black)),
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
                onPressed: null,
                child: Column(
                  children: const [
                    Icon(Icons.settings, color: Colors.blue),
                    Text('Settings', style: TextStyle(color: Colors.blue))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is the settings page',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
