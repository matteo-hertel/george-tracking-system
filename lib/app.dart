import 'package:flutter/material.dart';
import 'package:george_tracking_system/app_config.dart';
import 'package:george_tracking_system/components/thumbnail.dart';
import 'package:george_tracking_system/components/card.dart';
import 'package:george_tracking_system/components/spinner.dart';
import 'package:george_tracking_system/src/location.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: AppConfig.of(context).appName,
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: new MyHomePage(config: AppConfig.of(context)));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.config}) : super(key: key);

  final AppConfig config;

  @override
  _MyHomePageState createState() => new _MyHomePageState(config: config);
}

class _MyHomePageState extends State<MyHomePage> {
  final AppConfig config;

  _MyHomePageState({this.config});

  StreamController _locationController;

  loadData() async {
    fetchLocation("${config.apiBaseUrl}gts/loadLatest").then((res) async {
      _locationController.add(res);
    }).catchError((err) async {
      _locationController.addError(err);
    });
  }

  Future<Null> _handleRefresh() async {
    loadData().then((res) async {
      _locationController.add(res);
    }).catchError((err) async {
      _locationController.addError(err);
    });
  }

  @override
  void initState() {
    _locationController = new StreamController();
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).accentColor,
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(config.appName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      config.heroImageUrl,
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
              child: new Stack(
                children: [
                  GTSCard(
                      child: StreamBuilder(
                    stream: _locationController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GTSCardContent(
                          destination: snapshot.data.destination,
                          eta: "${snapshot.data.eta}",
                          emoji: snapshot.data.emoji,
                        );
                      } else if (snapshot.hasError) {
                        return GTSCardContentError(
                            error: snapshot.error
                                .toString()
                                .replaceAll("Exception:", ""));
                      }

                      // By default, show a loading spinner
                      return Spinner();
                    },
                  )),
                  GTSThumbnail(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
