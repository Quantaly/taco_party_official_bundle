import 'dart:convert';
import 'dart:io';

export 'range.dart';

Future<void> generate(
  String filename, {
  num maxHorzVelocity,
  num minVertVelocity,
  num maxVertVelocity,
  num maxAngularVelocity,
  String name,
  Iterable<Map<String, Object>> images,
  String textColor,
  String backgroundColor,
  int numTacos,
  String soundUrl,
}) async {
  final jsonMap = <String, Object>{
    "maxHorzVelocity": maxHorzVelocity,
    "minVertVelocity": minVertVelocity,
    "maxVertVelocity": maxVertVelocity,
    "maxAngularVelocity": maxAngularVelocity,
    "name": name,
    "images": images.toList(),
    "textColor": textColor,
    "backgroundColor": backgroundColor,
    "numTacos": numTacos,
  };
  if (soundUrl != null) {
    jsonMap["soundUrl"] = soundUrl;
  }
  await File(filename).writeAsString(jsonEncode(jsonMap));
}

typedef ImageDataCallback = int Function(String);
ImageDataCallback ret(int val) => (_) => val;

Iterable<Map<String, Object>> genImages(
    String srcPrefix, Iterable<String> srcSuffixes,
    {ImageDataCallback getWidth,
    ImageDataCallback getHeight,
    ImageDataCallback getWeight}) sync* {
  for (var suffix in srcSuffixes) {
    final ret = <String, Object>{"src": "$srcPrefix$suffix"};
    if (getWidth != null) {
      ret["width"] = getWidth(suffix);
    }
    if (getHeight != null) {
      ret["height"] = getHeight(suffix);
    }
    if (getWeight != null) {
      ret["weight"] = getWeight(suffix);
    }
    yield ret;
  }
}
