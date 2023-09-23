import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_peertuber/injection.dart';
import 'package:flutter_peertuber/src/config/app_theme.dart';
import 'package:flutter_peertuber/src/core/bloc/instance/instance_cubit.dart';
import 'package:flutter_peertuber/src/core/bloc/media_player/media_player_bloc.dart';
import 'package:flutter_peertuber/src/features/navigation/presentation/screens/navigation.dart';
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
    return MaterialApp(
      title: 'PeerTuber',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MediaPlayerBloc>(
            create: (BuildContext context) => getIt<MediaPlayerBloc>(),
          ),
          BlocProvider<InstanceCubit>(
            create: (BuildContext context) => getIt<InstanceCubit>(),
          ),
        ],
        child: const NavScreen(),
      ),
    );
  }
}
