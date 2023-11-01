import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session2/ui/widgets/drawer_widget.dart';
import 'package:session2/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsBox = Hive.box(settings);
     final strings = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
        strings.appTitle ,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      drawer: DrawerWidget(settingsBox: settingsBox),
      body: Center(
        child: Container(
           color: Theme.of(context).colorScheme.inversePrimary,
          padding: const EdgeInsets.all(20),
          child:  Text(
           strings.appTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            
          ),
         
        ),
      )
    );
  }
}

