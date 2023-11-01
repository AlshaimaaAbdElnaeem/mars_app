 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:session2/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
ListTile selectThemes(BuildContext context) {
  Box settingsBox = Hive.box(settings);
   final strings = AppLocalizations.of(context)!;
    return ListTile(
          title:
              Text(strings.theme, style: Theme.of(context).textTheme.displaySmall),
          trailing: Builder(builder: (context) {
            return Switch(
              onChanged: (e) {
                settingsBox.put(isDark, e);
              },
              value: settingsBox.get(isDark, defaultValue: false),
            );
          }),
        );
  }