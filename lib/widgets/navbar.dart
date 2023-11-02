import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'E-VENTe',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: const Icon(Icons.menu),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


