import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:session2/ui/widgets/dropdown_button.dart';
import 'package:session2/ui/widgets/select_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.settingsBox});
  final Box settingsBox;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          selectThemes(context),
        const DrobdownButton()
        ],
      ),
    );
  }


}
