import 'package:flutter/widgets.dart';
import 'custom_button.dart';
import 'custom_input.dart';
import 'pokedex_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInput(
            text: "",
            label: "Nombre",
            controller: nameCtrl,
          ),
          CustomInput(
            text: "",
            label: "Correo",
            controller: emailCtrl,
          ),
          CustomInput(
            text: "",
            label: "Contraseña",
            controller: passCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          CustomButton(
            texto: "Registrarse",
            onPressed: () {
              Navigator.push(context, _slide(const PokedexScreen()));
            },
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _slide(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, animation, __, child) {
        final offset = Tween(begin: const Offset(1, 0), end: Offset.zero);
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return SlideTransition(position: offset.animate(curved), child: child);
      },
    );
  }
}
