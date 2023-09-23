import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBottomBar extends HookWidget {
  final Function(int) onTabChange;
  final int selectedIndex;
  final Animation<Offset> animation;

  const NavigationBottomBar(
      {required this.onTabChange,
      required this.selectedIndex,
      required this.animation,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 35.0),
          child: GNav(
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.black,
            iconSize: 30,
            gap: 4,
            padding: const EdgeInsets.all(10),
            selectedIndex: selectedIndex,
            onTabChange: (value) => onTabChange(value),
            /*onTabChange: (i) => setState(() {
                /*ref
                    .read(miniPlayerControllerProvider)
                    .animateToHeight(state: PanelState.MIN);*/
                _selectedIndex = i;
              }),*/
            tabs: [
              const GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.explore_outlined,
                text: 'Discover',
              ),
              const GButton(
                icon: Icons.add_circle_outlined,
                text: 'Add',
              ),
              const GButton(
                icon: Icons.subscriptions_outlined,
                text: 'Subscriptions',
              ),
              const GButton(
                icon: Icons.video_library_outlined,
                text: 'Library',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
