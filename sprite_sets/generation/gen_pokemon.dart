import 'gen.dart';

const numPokemon = 649;

void main() {
  generate(
    "pokemon.json",
    maxHorzVelocity: 2.5,
    minVertVelocity: 4.2,
    maxVertVelocity: 8.7,
    maxAngularVelocity: 2.7,
    name: "Pokémon!",
    images: genImages(
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/",
        range(numPokemon).map((i) => "${i + 1}.png")),
    textColor: "crimson",
    backgroundColor: "pink",
    numTacos: 151,
  );
}
