import 'package:flutter/material.dart';
import 'pokemon_list.dart';
import 'package:flutter/material.dart';


class PokemonDetailScreen extends StatelessWidget {
  final PokemonData pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  Color _typeColor(String type) {
    switch (type) {
      case "fire":
        return const Color(0xFFFF7043);
      case "water":
        return const Color(0xFF42A5F5);
      case "grass":
        return const Color(0xFF66BB6A);
      case "electric":
        return const Color(0xFFFFEB3B);
      case "fairy":
        return const Color(0xFFF48FB1);
      default:
        return const Color(0xFFD1C4E9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _typeColor(pokemon.type),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(pokemon.image, width: 130, height: 130),
            const SizedBox(height: 10),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 20),
            Text("HP: ${pokemon.hp}", style: const TextStyle(fontSize: 18)),
            Text("Ataque: ${pokemon.attack}", style: const TextStyle(fontSize: 18)),
            Text("Defensa: ${pokemon.defense}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Icon(Icons.star, size: 40, color: Color(0xFFFFFF00)),
          ],
        ),
      ),
    );
  }
}
