import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos_app/blocs/blocs.dart';
import 'package:photos_app/routes/routes.gr.dart';
import 'package:photos_app/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LibraryBloc())
      ],
      child: AutoTabsRouter(
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
      ),
    );
  }
}