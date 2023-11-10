import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:session2/data/api/api.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var strings = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.settings),
      ),
      body: FloatingActionButton(onPressed: (){
     Api().fetchPhotos(); 
      },
      child: const Icon(Icons.ac_unit),
      ),
    );
  }
}