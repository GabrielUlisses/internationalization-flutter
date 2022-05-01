import 'package:flutter/material.dart';

class LocationModel {
  final String langCode, countryCode;
  final String asset;
  final String name;

  const LocationModel(this.langCode, this.countryCode, this.asset, this.name);

  Locale get locale => Locale(langCode, countryCode);

  String get localeCode => langCode + "_" + countryCode;

  @override
  String toString() => name;
}
