import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Crear un nuevo usuario con email y contraseña
  Future<UserCredential> registerWithEmailPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  // Iniciar sesión con email y contraseña
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Obtener cambios de estado de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}