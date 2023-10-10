import 'package:flutter/material.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
