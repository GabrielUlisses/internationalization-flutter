import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/app/global/IoC/dependencies.dart';
import 'package:internationalization/app/home/screens/home_screen.dart';
import 'package:internationalization/l10n/l10n.dart';
import 'package:internationalization/l10n/localization/selected_locale.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback: (locale, supportedLocales) {
        final defaultLocale = L10n.all.where((e) => e.localeCode == Intl.systemLocale);
        if (defaultLocale.isNotEmpty) {
          container.registerInstance<SelectedLocale>(SelectedLocale(defaultLocale.first));
        }else{  
          container.registerInstance<SelectedLocale>(SelectedLocale(L10n.location));
        }
        return container.resolve<SelectedLocale>().value.locale;
      },
      supportedLocales: L10n.all.map((e) => e.locale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}
