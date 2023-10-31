import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:session2/utils/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.settingsBox});
final Box settingsBox ;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text("theme",
                style: Theme.of(context).textTheme.displaySmall),
            trailing: Builder(
              builder: (context) {
                return Switch(
                  onChanged: (e) {
                    settingsBox.put(isDark, e);
                  },
                  value: settingsBox.get(isDark,defaultValue: false),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}