//lib\main.dart
import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/screens/home_screen.dart';
import 'package:proyecto_e2_app/screens/login_screen.dart';
import 'package:proyecto_e2_app/screens/register_screen.dart';
import 'package:proyecto_e2_app/screens/create_event_screen.dart';
import 'package:proyecto_e2_app/screens/find_event_screen.dart';
import 'package:proyecto_e2_app/screens/event_details_screen.dart';
import 'package:proyecto_e2_app/screens/profile_screen.dart';

import 'package:provider/provider.dart';
import 'package:proyecto_e2_app/utils/theme_manager.dart';
import 'package:proyecto_e2_app/screens/permissions_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'E-VENTe',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.themeMode,
      initialRoute: '/permissions',
      routes: {
        '/permissions': (context) => PermissionsScreen(),
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