import 'package:flutter/cupertino.dart';
import 'package:internationalization/l10n/localization/location_model.dart';

class SelectedLocale extends ValueNotifier<LocationModel> {
  SelectedLocale(value) : super(value);

  void setLocale(LocationModel location) => value = location;
}
