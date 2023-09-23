import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_peertuber/injection.dart';
import 'package:flutter_peertuber/src/features/common/presentation/widgets/widgets.dart';
import 'package:flutter_peertuber/src/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        // Call the GetHomeVideosEvent when the page laods
        create: (_) => getIt<HomeBloc>()..add(GetHomeVideosEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            //! ------------- HOME: Loading State
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //! ------------- HOME: Loaded State
            if (state is HomeLoaded) {
              return CustomScrollView(slivers: [
                const CustomSliverAppBar(),
                SliverPadding(
                  // -- Add bottom padding so bottom nav does cover content
                  padding: const EdgeInsets.only(bottom: 160.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final video = state.videoList[index];
                        return VideoCard(
                          video: video,
                          hasPadding: false,
                        );
                      },
                      childCount: state.videoList.length,
                    ),
                  ),
                )
              ]);
            }

            //! ------------- HOME: Error State
            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            //! ------------- No state was triggers (something bad happened)
            return const Center(child: Text('Something went wrong!'));
          },
        ),
      ),
    );
  }
}
