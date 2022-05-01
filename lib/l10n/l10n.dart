import 'package:internationalization/app/global/constants/assets.dart';
import 'package:internationalization/l10n/localization/location_model.dart';

class L10n {
  static const LocationModel location =
      LocationModel('en', 'US', AssetIcons.icUnitedStates, "English");

  static const List<LocationModel> all = <LocationModel>[
    LocationModel('pt', 'BR', AssetIcons.icBrazil, "Brasil"),
    LocationModel('en', 'US', AssetIcons.icUnitedStates, "English"),
    LocationModel('es', 'ES', AssetIcons.icSpain, "Spañol"),
  ];
}
