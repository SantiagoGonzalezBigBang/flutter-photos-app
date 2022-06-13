import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos_app/blocs/blocs.dart';
import 'package:photos_app/routes/routes.gr.dart';
import 'package:photos_app/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    AppState(
      isInitialPermisionGranted: await PermissionService.isPermissionGranted(),
    )
  );
} 

class AppState extends StatelessWidget {
  const AppState({
    Key? key, 
    required this.isInitialPermisionGranted
  }) : super(key: key);

  final bool isInitialPermisionGranted;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LibraryBloc(isInitialPermisionGranted))
      ], 
      child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routes = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Photos App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,        
      ),
      routerDelegate: _routes.delegate(),
      routeInformationParser: _routes.defaultRouteParser(),
    );
  }
}