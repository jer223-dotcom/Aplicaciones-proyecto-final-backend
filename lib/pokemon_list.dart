class PokemonData {
  final String name;
  final String image;
  final String type;
  final int hp;
  final int attack;
  final int defense;

  PokemonData({
    required this.name,
    required this.image,
    required this.type,
    required this.hp,
    required this.attack,
    required this.defense,
  });
}

final List<PokemonData> pokemonList = [
  PokemonData(
    name: "Bulbasaur",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
    type: "grass",
    hp: 45,
    attack: 49,
    defense: 49,
  ),
  PokemonData(
    name: "Charmander",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
    type: "fire",
    hp: 39,
    attack: 52,
    defense: 43,
  ),
  PokemonData(
    name: "Squirtle",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
    type: "water",
    hp: 44,
    attack: 48,
    defense: 65,
  ),
  PokemonData(
    name: "Pikachu",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
    type: "electric",
    hp: 35,
    attack: 55,
    defense: 40,
  ),
  PokemonData(
    name: "Eevee",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png",
    type: "normal",
    hp: 55,
    attack: 55,
    defense: 50,
  ),
  PokemonData(
    name: "Jigglypuff",
    image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png",
    type: "fairy",
    hp: 115,
    attack: 45,
    defense: 20,
  ),
];
