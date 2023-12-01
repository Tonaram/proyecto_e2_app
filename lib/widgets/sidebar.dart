//lib\widgets\sidebar.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_e2_app/services/auth_service.dart';

import '../providers/theme_manager.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // Acceder al estado de autenticación del usuario
    User? user = Provider.of<User?>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Create Event'),
            onTap: () {
              Navigator.of(context).pushNamed('/createEvent');
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Find Event'),
            onTap: () {
              Navigator.of(context).pushNamed('/findEvent');
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Toggle Theme'),
            onTap: () {
              final themeManager = Provider.of<ThemeManager>(context, listen: false);
              themeManager.toggleTheme();
            },
          ),
          const Divider(),
          if (user == null)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await AuthService().signOut(); // Cierra la sesión del usuario
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', // Navega al login y elimina todas las rutas anteriores
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
        ],
      ),
    );
  }
}

