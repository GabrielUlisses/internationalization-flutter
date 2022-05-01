import 'package:flutter/material.dart';
import 'package:internationalization/app/global/constants/assets.dart';
import 'package:internationalization/l10n/l10n.dart';
import 'package:localization/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.i18n()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.language,
            ),
            Text(
              AppLocalizations.of(context)!.welcome_message("Gabriel Andrade"),
            ),
            Image.asset(AssetImages.flagBrazil)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null, child: menu() //const Icon(Icons.language),
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget menu() {
    return PopupMenuButton(
        icon: const Icon(Icons.language),
        itemBuilder: (BuildContext context) => L10n.all
            .map((location) => PopupMenuItem(
                  child: ListTile(
                    leading: Image.asset(location.asset, height: 20, width: 20),
                    title: Text(location.name),
                  ),
                ))
            .toList());
  }
}
