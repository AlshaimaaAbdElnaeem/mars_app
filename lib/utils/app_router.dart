import 'package:go_router/go_router.dart';

import 'package:session2/ui/screens/home_page.dart';
import 'package:session2/ui/screens/settings_page.dart';
import 'package:session2/utils/router_constants.dart';

GoRouter goRouter() {
  return GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: settingPage,
      builder: (context, state) => const SettingsPage(),
    )
  ]);
}
