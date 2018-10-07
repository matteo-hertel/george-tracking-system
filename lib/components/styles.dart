import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(fontFamily: 'Roboto');
final regularTextStyle = baseTextStyle.copyWith(
    color: Colors.white, fontSize: 9.0, fontWeight: FontWeight.w400);
final emojiTextStyle = regularTextStyle.copyWith(fontSize: 30.0);
final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 18.0);
final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);
