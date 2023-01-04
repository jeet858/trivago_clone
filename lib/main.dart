import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivago_clone/models/datetime.dart';
import 'package:trivago_clone/models/guests.dart';
import 'package:trivago_clone/models/hotels.dart';
import 'package:trivago_clone/screens/calender.dart';
import 'package:trivago_clone/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DateData()),
        ChangeNotifierProvider(create: (context) => Guests()),
        ChangeNotifierProvider(create: (context) => HotelData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeSreen(),
        routes: {
          DateSelector.id: (context) => DateSelector(),
        },
      ),
    );
  }
}
