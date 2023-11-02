import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400, 
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/undraw_Sign_up_n6im.png',
                  height: MediaQuery.of(context).size.height * 0.33,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                const _CustomTextField(hintText: 'Username'),
                const SizedBox(height: 10),
                const _CustomTextField(hintText: 'Email'),
                const SizedBox(height: 10),
                const _CustomTextField(hintText: 'Password', obscureText: true),
                const SizedBox(height: 10),
                const _CustomTextField(hintText: 'Confirm Password', obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text(
                    'Login instead',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const _CustomTextField({required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
