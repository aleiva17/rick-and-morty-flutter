import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rick_and_morty_universe/navigation/models/enumeration/app_route.dart';

class EnhancedBottomNavigationBar extends StatelessWidget {
  final void Function(AppRoute) navigateTo;

  const EnhancedBottomNavigationBar({super.key, required this.navigateTo});

  void handleTabChange(int index) {
    AppRoute destination = AppRoute.notFound;

    switch (index) {
      case 0: destination = AppRoute.home;
      case 1: destination = AppRoute.characterSearch;
      case 2: destination = AppRoute.favoriteCharacters;
      default: destination = AppRoute.notFound;
    }

    navigateTo(destination);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.greenAccent,
            tabBackgroundColor: Colors.black12,
            activeColor: Colors.white,
            color: Colors.teal,
            onTabChange: handleTabChange,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                  icon: Icons.favorite_border,
                  text: "Favorites"
              )
            ],
          )
      ),
    );
  }
}
