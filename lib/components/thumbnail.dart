import 'package:flutter/material.dart';
import 'package:george_tracking_system/app_config.dart';

Container GTSThumbnail(context) {
  return new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: new ClipRRect(
      borderRadius: new BorderRadius.circular(50.0),
      child: new Image.network(
        AppConfig
            .of(context)
            .avatarUrl,
        height: 92.0,
        width: 92.0,
      ),
    ),
  );
}