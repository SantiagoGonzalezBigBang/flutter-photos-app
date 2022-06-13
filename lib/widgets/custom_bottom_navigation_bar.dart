import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key, 
    required this.tabsRouter
  }) : super(key: key);

  final TabsRouter tabsRouter;
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      backgroundColor: Colors.transparent,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        height: 1.5,        
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        height: 1.5,        
      ),
      elevation: 0.0,      
      iconSize: 30.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Library'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          label: 'For You'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.album_rounded),
          label: 'Albums'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search'
        ),
      ]
    );
  }
}