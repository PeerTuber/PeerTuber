import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/injection.dart';
import 'package:peertuber/src/features/auth/presentation/screens/login_screen.dart';
import 'package:peertuber/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/home/presentation/screens/home.dart';
import 'package:peertuber/src/features/navigation/presentation/screens/navigation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // TODO(mikehuntington): Add the auth bloc as an input
  AppRouter();

  late final GoRouter router = GoRouter(
    // TODO(mikehuntington): set initial location to login
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (context, state) {
              return const SignupScreen();
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MediaPlayerBloc>(
                create: (BuildContext context) => getIt<MediaPlayerBloc>(),
              ),
              BlocProvider<InstanceCubit>(
                create: (BuildContext context) => getIt<InstanceCubit>(),
              ),
            ],
            child: NavScreen(navigationShell: navigationShell),
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/discover',
                builder: (BuildContext context, GoRouterState state) {
                  return const Center(
                    child: Text('Discover'),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/add',
                builder: (BuildContext context, GoRouterState state) {
                  return const Center(
                    child: Text('Add'),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/subscriptions',
                builder: (BuildContext context, GoRouterState state) {
                  return const Center(
                    child: Text('Subscriptions'),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/library',
                builder: (BuildContext context, GoRouterState state) {
                  return const Center(
                    child: Text('Library'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
