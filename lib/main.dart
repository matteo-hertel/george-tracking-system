import 'package:george_tracking_system/app_config.dart';
import 'package:george_tracking_system/app.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'George Tracking System',
    apiBaseUrl: 'https://www.georgegillams.co.uk/api/gts/loadLatest',
    heroImageUrl: 'https://images.unsplash.com/photo-1524146128017-b9dd0bfd2778?ixlib=rb-0.3.5&auto=format&fit=crop&w=400&q=80',
    avatarUrl: 'https://avatars2.githubusercontent.com/u/30267516',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
