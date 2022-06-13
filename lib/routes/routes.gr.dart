// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/screens.dart' as _i1;

class Routes extends _i2.RootStackRouter {
  Routes([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    },
    LibraryRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LibraryScreen());
    },
    ForYouRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ForYouScreen());
    },
    AlbumsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AlbumsScreen());
    },
    SearchRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SearchScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(MainScreen.name, path: '/', children: [
          _i2.RouteConfig(LibraryRouter.name,
              path: 'library', parent: MainScreen.name),
          _i2.RouteConfig(ForYouRouter.name,
              path: 'foryou', parent: MainScreen.name),
          _i2.RouteConfig(AlbumsRouter.name,
              path: 'albums', parent: MainScreen.name),
          _i2.RouteConfig(SearchRouter.name,
              path: 'search', parent: MainScreen.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreen extends _i2.PageRouteInfo<void> {
  const MainScreen({List<_i2.PageRouteInfo>? children})
      : super(MainScreen.name, path: '/', initialChildren: children);

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i1.LibraryScreen]
class LibraryRouter extends _i2.PageRouteInfo<void> {
  const LibraryRouter() : super(LibraryRouter.name, path: 'library');

  static const String name = 'LibraryRouter';
}

/// generated route for
/// [_i1.ForYouScreen]
class ForYouRouter extends _i2.PageRouteInfo<void> {
  const ForYouRouter() : super(ForYouRouter.name, path: 'foryou');

  static const String name = 'ForYouRouter';
}

/// generated route for
/// [_i1.AlbumsScreen]
class AlbumsRouter extends _i2.PageRouteInfo<void> {
  const AlbumsRouter() : super(AlbumsRouter.name, path: 'albums');

  static const String name = 'AlbumsRouter';
}

/// generated route for
/// [_i1.SearchScreen]
class SearchRouter extends _i2.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}
