import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class PokemonCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const PokemonCard({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Image.network(image, width: 80, height: 80),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
