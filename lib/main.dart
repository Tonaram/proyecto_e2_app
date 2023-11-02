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
import 'package:proyecto_e2_app/providers/theme_manager.dart';
import 'package:proyecto_e2_app/screens/permissions_screen.dart';
import 'package:proyecto_e2_app/providers/event_provider.dart';

void main() {
  runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/permissions': (context) => const PermissionsScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/eventDetails': (context) => const EventDetailsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/createEvent': (context) => const CreateEventScreen(),
        '/findEvent': (context) => const FindEventScreen(),
      },
    );
  }
}