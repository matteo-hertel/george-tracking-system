import 'package:flutter/material.dart';
import 'package:george_tracking_system/app_config.dart';
import 'package:george_tracking_system/components/thumbnail.dart';
import 'package:george_tracking_system/components/card.dart';

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

Container papoi(context) {
  return new Container(
      alignment: Alignment(0.0, 0.0),
      child: new CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).backgroundColor))
  );
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
                  title: Text("George Tracking System",
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
              child: new Stack(
                children: <Widget>[
                  GTSCard(context, papoi(context)),
                  GTSThumbnail(context),
                ],
              )),
        ),
      ),
    );
  }
}
