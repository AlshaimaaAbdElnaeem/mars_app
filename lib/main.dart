import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:session2/ui/screens/home_page.dart';
import 'package:session2/utils/color_schemes.g.dart';
import 'package:session2/utils/constants.dart';
import 'package:session2/utils/typography%20.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(settings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(settings).listenable(),
      builder: (__, value, child) {
        bool isDarkValue = Hive.box(settings).get(isDark, defaultValue: false);
        String lang = Hive.box(settings).get(language, defaultValue: "en");
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale:Locale(lang) ,
          debugShowCheckedModeBanner: false,
          title: 'appTitle',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
            textTheme: textTheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
            textTheme: textTheme,
          ),
          home: const HomePage(),
          themeMode: isDarkValue ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
