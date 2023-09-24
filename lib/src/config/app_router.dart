import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_peertuber/injection.dart';
import 'package:flutter_peertuber/src/core/bloc/instance/instance_cubit.dart';
import 'package:flutter_peertuber/src/core/bloc/media_player/media_player_bloc.dart';
import 'package:flutter_peertuber/src/features/home/presentation/screens/home.dart';
import 'package:flutter_peertuber/src/features/navigation/presentation/screens/navigation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // TODO: Add the auth bloc as an input
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Container();
        },
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
