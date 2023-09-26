import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:peertuber/src/features/auth/presentation/blocs/login/login_cubit.dart';

import '../../../common/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorText ?? 'Authentication Failure'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.close)),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Spacer(flex: 3),
                _Username(),
                SizedBox(
                  height: 20.0,
                ),
                _Password(),
                SizedBox(
                  height: 20.0,
                ),
                _LoginButton(),
                Spacer(flex: 2),
                _SignupRedirect(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignupRedirect extends StatelessWidget {
  const _SignupRedirect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('signup');
      },
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
            ),
            TextSpan(
              text: 'Signup',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  state.status == FormzSubmissionStatus.success
                      ? context.read<LoginCubit>().loginWithCredentials()
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text('Invalid username or password'),
                        ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
              );
      },
    );
  }
}

class _Password extends StatelessWidget {
  const _Password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.password != current.password;
      },
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Password',
          obscureText: true,
          textInputType: TextInputType.name,
          errorText: state.password.isNotValid && !state.password.isPure
              ? 'Invalid username'
              : null,
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
        );
      },
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.username != current.username;
      },
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Username',
          textInputType: TextInputType.name,
          errorText: state.username.isNotValid && !state.username.isPure
              ? 'Invalid username'
              : null,
          onChanged: (username) {
            context.read<LoginCubit>().usernameChanged(username);
          },
        );
      },
    );
  }
}
