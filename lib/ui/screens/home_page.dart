import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session2/utils/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsBox = Hive.box(settings);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mars Photos",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      drawer: Drawer(
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
      ),
      body: Center(
        child: Container(
           color: Theme.of(context).colorScheme.inversePrimary,
          padding: const EdgeInsets.all(20),
          child:  Text(
            "Mars Photos",
            style: Theme.of(context).textTheme.bodyMedium,
            
          ),
         
        ),
      )
    );
  }
}
