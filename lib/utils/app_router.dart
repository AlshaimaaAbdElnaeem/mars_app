import 'package:go_router/go_router.dart';

import 'package:session2/ui/screens/home_page.dart';
import 'package:session2/ui/screens/latest_photo_page.dart';
import 'package:session2/utils/router_constants.dart';

GoRouter goRouter() {
  return GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(path: latestPage ,
    builder: (context , state)=>  LatestPhotoPage(),
    )
  ]);
}
