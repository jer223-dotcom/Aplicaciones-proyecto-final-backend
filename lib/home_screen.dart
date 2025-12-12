import 'package:flutter/material.dart';
import 'login.dart';
import 'sign_up.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Animación simple de transición
  Route _slide(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation =
            Tween(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenido",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, _slide(LoginPage()));
              },
              child: const Text("Iniciar Sesión"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, _slide(SignupPage()));
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}



