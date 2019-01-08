import 'dart:convert';
import 'dart:io';

const int numPokemon = 649;

void main() {
  final jsonMap = <String, Object>{
    "maxHorzVelocity": 2.5,
    "minVertVelocity": 4.2,
    "maxVertVelocity": 8.7,
    "maxAngularVelocity": 2.7,
    "name": "Pokémon!",
    "images": genImages().toList(),
    "textColor": "crimson",
    "backgroundColor": "pink",
    "numTacos": 151,
  };
  File("pokemon.json").writeAsString(jsonEncode(jsonMap));
}

Iterable<Object> genImages() sync* {
  for (int i = 1; i <= numPokemon; i++) {
    yield {
      "src":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$i.png"
    };
  }
}
