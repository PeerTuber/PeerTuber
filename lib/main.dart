import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_peertuber/injection.dart';
import 'package:flutter_peertuber/src/config/app_router.dart';
import 'package:flutter_peertuber/src/config/app_theme.dart';
import 'package:media_kit/media_kit.dart';

void main() {
  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  // Necessary initialization for package:media_kit.
  MediaKit.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: 'PeerTuber',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme(),
      routerConfig: AppRouter().router,
    );
  }
}
