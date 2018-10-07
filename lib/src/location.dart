import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Location> fetchLocation(url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Location.fromJson(json.decode(response.body));
  } else {
    print(response.statusCode);
    // If that call was not successful, throw an error.
    throw Exception(
        '👈 Have you seen this man?\n No tracking data available 😱');
  }
}

class Location {
  final String destination;
  final String eta;
  final String emoji;

  Location({this.destination, this.eta, this.emoji});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      destination: json['destination'],
      eta: json['eta'],
      emoji: json['emoji'],
    );
  }
}