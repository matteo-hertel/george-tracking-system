import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: new ClipRRect(
      borderRadius: new BorderRadius.circular(50.0),
      child: new Image.network(
        'https://avatars2.githubusercontent.com/u/30267516?s=400&v=4',
        height: 92.0,
        width: 92.0,
      ),
    ),
  );

   static final baseTextStyle = const TextStyle(
      fontFamily: 'Roboto'
  );
  static final regularTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 9.0,
      fontWeight: FontWeight.w400
  );
  static final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
  );

  static final planetCardContent = new Container(
    margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 4.0),
        new CircularProgressIndicator(),
        new Text('Title',
          style: headerTextStyle,
        ),
        new Container(height: 10.0),
        new Text('More Copy with emoji 🤘',
            style: subHeaderTextStyle

        ),
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff)
        ),

      ],
    ),
  );

  Container planetCard(context){

  return new Container(
    height: 150.0,
    margin: new EdgeInsets.only(left: 46.0),
    child: planetCardContent,
    decoration: new BoxDecoration(
      color: Theme.of(context).accentColor,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
  }


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
                    "https://images.unsplash.com/photo-1524146128017-b9dd0bfd2778?ixlib=rb-0.3.5&auto=format&fit=crop&w=400&q=80",
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
                  planetCard(context),
                  planetThumbnail,
                ],
              )),
        ),
      ),
    );
  }
}
