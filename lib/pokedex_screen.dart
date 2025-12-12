import 'package:flutter/widgets.dart';
import 'pokemon_list.dart';
import 'pokemon_card.dart';
import 'pokemon_detail_screen.dart';


class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Barra de búsqueda
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: EditableText(
              controller: searchCtrl,
              focusNode: FocusNode(),
              style: const TextStyle(fontSize: 16, color: Color(0xFF000000)),
              cursorColor: const Color(0xFF3333FF),
              backgroundCursorColor: const Color(0xFF3333FF),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              itemCount: pokemonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final p = pokemonList[index];
                return PokemonCard(
                  name: p.name,
                  image: p.image,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slide(PokemonDetailScreen(pokemon: p)),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  PageRouteBuilder _slide(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, animation, __, child) {
        final offset = Tween(begin: const Offset(1, 0), end: Offset.zero);
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);
        return SlideTransition(position: offset.animate(curved), child: child);
      },
    );
  }
}
