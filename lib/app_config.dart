import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.apiBaseUrl,
    @required this.heroImageUrl,
    @required this.avatarUrl,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String apiBaseUrl;
  final String heroImageUrl;
  final String avatarUrl;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}