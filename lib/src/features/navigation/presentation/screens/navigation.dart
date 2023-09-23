import 'package:flutter/material.dart';
import 'package:flutter_peertuber/src/features/home/presentation/screens/home.dart';
import 'package:flutter_peertuber/src/features/navigation/presentation/widgets/navigation_bottom_bar.dart';
import 'package:flutter_peertuber/src/features/video_details/presentation/screens/video_details_slidein.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> _animation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0, 5)).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Discover'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subscriptions'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      ),
                    ))
                .values
                .toList(),
          ),
          VideoDetailsSlidein(
            onSlideIn: () => _animationController.animateTo(0.15),
            onSlideOut: () => _animationController.animateTo(-10.5),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBottomBar(
        animation: _animation,
        selectedIndex: _selectedIndex,
        onTabChange: (int index) => setState(
          () {
            _selectedIndex = index;
          },
        ),
      ),
    );
  }
}
