
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:session2/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DrobdownButton extends StatelessWidget {
  const DrobdownButton ({super.key});

  @override
  Widget build(BuildContext context) {
    var strings = AppLocalizations.of(context);
    return ListTile(title: Text(strings!.language),
    trailing: DropdownButton(items: <String> ["en","ar"].map((e) => DropdownMenuItem( value : e ,child: Text (e=="ar" ? "Arabic" : "English"))).toList(), onChanged: (v){
      Hive.box(settings).put(language, v);
    }),);
  }
}