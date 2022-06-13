import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:photos_app/routes/routes.gr.dart';
import 'package:photos_app/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        LibraryRouter(),
        ForYouRouter(),
        AlbumsRouter(),
        SearchRouter()
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}