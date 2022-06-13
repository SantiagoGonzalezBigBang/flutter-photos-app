import 'package:flutter/material.dart';

import 'package:photos_app/routes/routes.gr.dart';

void main() async {
  runApp(MyApp());
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