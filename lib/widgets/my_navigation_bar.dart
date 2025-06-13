import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    this.indicatorColor = const Color.fromARGB(255, 189, 132, 111),
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final Color indicatorColor;
  
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected, 
      indicatorColor: indicatorColor,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.checklist),
          icon: Icon(Icons.checklist_outlined),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.trending_up_outlined),
          label: "Statistics"
        )
      ],
    );
  }
}
