//lib\main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_e2_app/services/auth_service.dart';
import 'package:proyecto_e2_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_e2_app/screens/home_screen.dart';
import 'package:proyecto_e2_app/screens/login_screen.dart';
import 'package:proyecto_e2_app/screens/register_screen.dart';
import 'package:proyecto_e2_app/screens/create_event_screen.dart';
import 'package:proyecto_e2_app/screens/find_event_screen.dart';
import 'package:proyecto_e2_app/screens/event_details_screen.dart';
import 'package:proyecto_e2_app/screens/profile_screen.dart';
import 'package:proyecto_e2_app/providers/theme_manager.dart';
import 'package:proyecto_e2_app/screens/permissions_screen.dart';
import 'package:proyecto_e2_app/providers/event_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inicializa Firebase con las opciones generadas
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        StreamProvider<User?>.value(
          value: AuthService().authStateChanges,
          initialData: null,
        ),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, _) {
          return MaterialApp(
            title: 'E-VENTe',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: themeManager.themeMode, // Accede al themeMode directamente desde el ThemeManager
            initialRoute: '/permissions',
            routes: {
              '/permissions': (context) => const PermissionsScreen(),
              '/auth': (context) => const AuthWrapper(),
              '/home': (context) => const HomeScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/eventDetails': (context) => const EventDetailsScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/createEvent': (context) => const CreateEventScreen(),
              '/findEvent': (context) => const FindEventScreen(),
            },
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    
    // Decide cuál pantalla mostrar basado en el estado de autenticación
    if (user != null) {
      return const HomeScreen(); // Si el usuario está autenticado, muestra la pantalla de inicio
    }
    return const LoginScreen(); // Si no hay usuario autenticado, muestra la pantalla de inicio de sesión
  }
}