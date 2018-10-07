import 'package:flutter/material.dart';
import 'package:george_tracking_system/app_config.dart';
import 'package:george_tracking_system/components/thumbnail.dart';
import 'package:george_tracking_system/components/card.dart';
import 'package:george_tracking_system/components/spinner.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Location> fetchLocation(url) async {
  final response =
  await http.get(url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Location.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('👈 Have you seen this man?\n No tracking data available 😱');
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: AppConfig.of(context).appName,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: AppConfig.of(context).appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).accentColor,
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(AppConfig.of(context).appName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    AppConfig.of(context).heroImageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: new Container(
              height: 150.0,
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: new Stack(children:  [
                GTSCard(child: FutureBuilder<Location>(
                  future: fetchLocation("${AppConfig.of(context).apiBaseUrl}gts/loadLatest"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GTSCardContent(
                        destination: snapshot.data.destination,
                        eta: snapshot.data.eta,
                        emoji: snapshot.data.emoji,
                      );
                    } else if (snapshot.hasError) {
                      return GTSCardContentError(error: snapshot.error.toString().replaceAll("Exception:", ""));
                    }

                    // By default, show a loading spinner
                    return Spinner();
                  },
                )),
                  GTSThumbnail(context),
                ],
              )),
        ),
      ),
    );
  }
}
