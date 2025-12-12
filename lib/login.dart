import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    print("LOGIN PRESIONADO"); // ← prueba 1

    final url = Uri.parse("http://192.168.1.72:3000/login"); // usa tu IP LAN

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    print("RESPUESTA DEL SERVIDOR:");
    print(response.statusCode);
    print(response.body);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["status"] == "ok") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login exitoso"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushNamed(context, "/pokedex");

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data["message"] ?? "Error al iniciar sesión"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("PANTALLA LOGIN CARGADA"); // ← prueba 2

    return Scaffold(
      body: Column(
        children: [
          TextField(controller: emailController),
          TextField(controller: passwordController, obscureText: true),
          ElevatedButton(
            onPressed: login, // ← ejecuta la función
            child: const Text("Iniciar sesión"),
          ),
        ],
      ),
    );
  }
}



