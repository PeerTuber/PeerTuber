import 'package:flutter/material.dart';
import 'package:peertuber/src/features/navigation/presentation/widgets/navigation_bottom_bar.dart';
import 'package:peertuber/src/features/video_details/presentation/screens/video_details_slidein.dart';
import 'package:go_router/go_router.dart';

class NavScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const NavScreen({super.key, required this.navigationShell});

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
          widget.navigationShell,
          VideoDetailsSlidein(
            onSlideIn: () => _animationController.animateTo(0.15),
            onSlideOut: () => _animationController.animateTo(-10.5),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBottomBar(
        animation: _animation,
        selectedIndex: widget.navigationShell.currentIndex,
        onTabChange: (int index) => setState(
          () {
            widget.navigationShell.goBranch(index);
          },
        ),
      ),
    );
  }
}
