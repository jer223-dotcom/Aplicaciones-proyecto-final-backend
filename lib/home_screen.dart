import 'package:flutter/widgets.dart';
import 'custom_button.dart';
import 'login.dart';
import 'sign_up.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            texto: "Login",
            onPressed: () {
              Navigator.push(context, _slide(const LoginScreen()));
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            texto: "Signup",
            onPressed: () {
              Navigator.push(context, _slide(const SignUpScreen()));
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

