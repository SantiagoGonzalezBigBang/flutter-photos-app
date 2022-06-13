import 'package:auto_route/auto_route.dart';

import 'package:photos_app/screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: MainScreen,
      children: [
        AutoRoute(
          path: 'library',
          name: 'LibraryRouter',
          page: LibraryScreen
        ),
        AutoRoute(
          path: 'foryou',
          name: 'ForYouRouter',
          page: ForYouScreen
        ),
        AutoRoute(
          path: 'albums',
          name: 'AlbumsRouter',
          page: AlbumsScreen
        ),
        AutoRoute(
          path: 'search',
          name: 'SearchRouter',
          page: SearchScreen
        ),
      ]
    )
  ]
)

class $Routes {}

// flutter pub run build_runner build --delete-conflicting-outputs
// flutter pub run build_runner watch --delete-conflicting-outputs