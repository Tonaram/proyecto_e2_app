// lib\screens\permissions_screen.dart
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool _termsAccepted = false;

  Future<void> requestPermissions() async {

    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    if (allGranted && _termsAccepted) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor, otorga todos los permisos y acepta los términos y condiciones."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Para continuar, necesitamos algunos permisos y que aceptes los términos y condiciones.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestPermissions,
              child: const Text("Permitir permisos"),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // enlace con términos y condiciones
                    },
                    child: const Text(
                      "Acepto los términos y condiciones",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
