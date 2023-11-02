import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/screens/home_screen.dart';
import 'package:proyecto_e2_app/screens/login_screen.dart';
import 'package:proyecto_e2_app/screens/register_screen.dart';
import 'package:proyecto_e2_app/screens/create_event_screen.dart';
import 'package:proyecto_e2_app/screens/find_event_screen.dart';
import 'package:proyecto_e2_app/screens/event_details_screen.dart';
import 'package:proyecto_e2_app/screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-VENTe',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/eventDetails': (context) => EventDetailsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/createEvent': (context) => CreateEventScreen(),
        '/findEvent': (context) => FindEventScreen(),
      },
    );
  }
}
