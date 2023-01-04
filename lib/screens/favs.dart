import 'package:flutter/material.dart';
import 'package:trivago_clone/screens/settings.dart';
import 'package:trivago_clone/screens/welcome_screen.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

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
                onPressed: null,
                child: Column(
                  children: const [
                    Icon(Icons.favorite, color: Colors.blue),
                    Text('Favourites', style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                child: Column(
                  children: const [
                    Icon(Icons.settings, color: Colors.black),
                    Text('Settings', style: TextStyle(color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is the Favourites page',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
