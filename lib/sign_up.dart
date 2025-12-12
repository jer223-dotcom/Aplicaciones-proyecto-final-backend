import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    final url = Uri.parse("http://localhost:3000/signup");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nombre": nombreController.text,
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["status"] == "ok") {
      // ÉXITO
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registro exitoso"),
          backgroundColor: Colors.green,
        ),
      );

      // Ir al login
      Navigator.pushNamed(context, "/login");

    } else {
      // ERROR
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data["message"] ?? "Error al registrarse"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Cuenta")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre completo",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Correo",
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}




