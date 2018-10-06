import 'package:flutter/material.dart';
import 'package:george_tracking_system/app_config.dart';
import 'package:george_tracking_system/components/styles.dart';

Container GTSCardContent(context) {
  return new Container(
    margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 4.0),
        new Text(
          AppConfig.of(context).appName,
          style: headerTextStyle,
        ),
        new Container(height: 10.0),
        new Text('More Copy with emoji 🤘〽️', style: subHeaderTextStyle),
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff)),
      ],
    ),
  );
}

Container GTSCard(context, Widget child) {
  return new Container(
    height: 150.0,
    margin: new EdgeInsets.only(left: 46.0),
    child: child,
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
