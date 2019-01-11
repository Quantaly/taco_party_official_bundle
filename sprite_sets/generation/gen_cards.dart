import 'gen.dart';

const ranks = [
  "A",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "J",
  "Q",
  "K"
];
const suits = ["C", "D", "H", "S"];

void main() {
  generate(
    "cards.json",
    maxHorzVelocity: 4,
    minVertVelocity: 5,
    maxVertVelocity: 10.3,
    maxAngularVelocity: 3,
    name: "Cards!",
    images: genImages(
        "https://quantumassembly.github.io/taco_party_official_bundle/assets/images/card_",
        genSuffixes(),
        getWidth: ret(173),
        getHeight: ret(264)),
    textColor: "#2fc41e",
    backgroundColor: "#343434",
    numTacos: 30,
  );
}

Iterable<String> genSuffixes() sync* {
  for (var rank in ranks) {
    for (var suit in suits) {
      yield "$rank$suit.png";
    }
  }
}
