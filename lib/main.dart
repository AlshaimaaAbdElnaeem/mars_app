import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:session2/ui/screens/home_page.dart';
import 'package:session2/utils/color_schemes.g.dart';
import 'package:session2/utils/constants.dart';
import 'package:session2/utils/typography%20.dart';

void main() async{
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
      builder: (__, value,child ) {  
         bool isDarkValue =  Hive.box(settings).get(isDark,defaultValue: false);
return  MaterialApp(
  //  supportedLocales: localization.supportedLocales,
  //  localizationsDelegates: localization.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        title: 'app Title',
        theme : ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
           textTheme: textTheme,
        ),
        home:const HomePage(),
        themeMode:isDarkValue ? ThemeMode.dark :ThemeMode.light ,
      );
      }
      
      ,
      
    );
  }
}
