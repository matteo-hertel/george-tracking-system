import 'package:flutter/material.dart';
import 'package:george_tracking_system/components/styles.dart';

class GTSCardContentError extends StatelessWidget {
  final String error;

  GTSCardContentError({
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(55.0, 0.0,0.0,0.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(height: 4.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 10.0),
              child: new Text(error, style: subHeaderTextStyle),
            ),
          ]
      ),
    );
  }
}

class GTSCardContent extends StatelessWidget {
  final String destination;
  final String emoji;
  final String eta;

  GTSCardContent({
    this.destination,
    this.eta,
    this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(height: 4.0),
            new Text(
              "Destination: $destination",
              style: headerTextStyle,
            ),
            new Container(height: 10.0),
            new Text("Eta: $eta", style: subHeaderTextStyle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(emoji, style: emojiTextStyle),
            ),
          ]
      ),
    );
  }
}

class GTSCard extends StatelessWidget {
  final Widget child;

  GTSCard({this.child});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150.0,
      margin: new EdgeInsets.only(left: 46.0),
      child: child,
      decoration: new BoxDecoration(
        color: Theme
            .of(context)
            .accentColor,
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
}
