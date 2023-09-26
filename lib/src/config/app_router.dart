import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:peertuber/src/features/auth/presentation/screens/login_screen.dart';
import 'package:peertuber/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:peertuber/src/features/home/presentation/screens/home.dart';
import 'package:peertuber/src/features/navigation/presentation/screens/navigation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: '/',
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
          return NavScreen(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/',
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
    redirect: (context, state) {
      final loginLocation = state.namedLocation('login');
      final signupLocation = state.namedLocation('signup');

      final bool isLoggedIn = authBloc.state.status == AuthStatus.authenticated;

      final bool isLoggingIn = state.matchedLocation == loginLocation;
      final bool isSigningUp = state.matchedLocation == signupLocation;

      if (isLoggedIn) {
        if (isLoggingIn || isSigningUp) {
          return '/';
        }
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
