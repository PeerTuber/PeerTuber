import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/injection.dart';
import 'package:peertuber/src/config/app_router.dart';
import 'package:peertuber/src/config/app_theme.dart';
import 'package:media_kit/media_kit.dart';
import 'package:peertuber/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:peertuber/src/features/auth/presentation/blocs/login/login_cubit.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider<MediaPlayerBloc>(
            create: (BuildContext context) => getIt<MediaPlayerBloc>(),
          ),
          BlocProvider<InstanceCubit>(
            create: (BuildContext context) => getIt<InstanceCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            title: 'PeerTuber',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme().theme(),
            routerConfig: AppRouter(context.read<AuthBloc>()).router,
          );
        }));
  }
}
