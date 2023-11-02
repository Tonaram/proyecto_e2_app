import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Lógica para cambiar el tema se hará a futuro
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
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

