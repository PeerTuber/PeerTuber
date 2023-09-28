import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:peertuber/injection.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart';
import 'package:peertuber/src/features/common/presentation/widgets/widgets.dart';
import 'package:peertuber/src/features/video_details/presentation/bloc/video_details_block.dart';

import '../widgets/widgets.dart';

class VideoDetails extends HookWidget {
  final VideoEntity? video;
  final MediaPlayerState playerState;
  final double miniPlayerPercentage;

  const VideoDetails(
      {super.key,
      required this.video,
      required this.playerState,
      required this.miniPlayerPercentage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<VideoDetailsBloc>()
              ..add(GetVideoDetailsEvent(video: video!))),
        BlocProvider(create: (_) => getIt<SearchVideosBloc>()),
      ],
      child: Container(
        color: Colors.black,
        child: SafeArea(
          bottom: false,
          top: (miniPlayerPercentage < 0.9) ? false : true,
          child: Column(
            children: [
              BlocListener<VideoDetailsBloc, VideoDetailsState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is VideoDetailsLoaded) {
                    context
                        .read<MediaPlayerBloc>()
                        .add(PlayMedia(video: state.video));
                    context
                        .read<MediaPlayerBloc>()
                        .miniController
                        .animateToHeight(state: PanelState.MAX);
                  }
                },
                child: BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
                  buildWhen: (previous, current) {
                    if (current is VideoDetailsLoaded) {
                      if (previous is VideoDetailsLoaded) {
                        return current.video.id != previous.video.id;
                      }
                    }

                    return false;
                  },
                  builder: (context, state) {
                    return VideoPlayer(
                      miniPlayerPercentage: miniPlayerPercentage,
                      video: (state is VideoDetailsLoaded)
                          ? state.video
                          : (playerState as MediaPlayerLoaded).video,
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
                  buildWhen: (previous, current) =>
                      current is VideoDetailsLoaded,
                  builder: (context, state) {
                    if (state is VideoDetailsLoaded) {
                      return _buildMainView(context, state.video, playerState);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -- Build Video Info and Search Data
  Widget _buildVideoInfo(BuildContext context, VideoEntity video) {
    return BlocBuilder<SearchVideosBloc, SearchVideosState>(
      builder: (context, state) {
        //! ------------- VIDEO SEARCH: Initial State
        if (state is SearchVideosInitial) {
          // TODO(mikehuntington): remove neovibe.app hardcoded url
          final data = SearchDataEntity(
              instanceHost: 'https://vids.neovibe.app',
              search: '',
              tagsOfOne: video.tags);
          context
              .read<SearchVideosBloc>()
              .add(PerformSearchVideosEvent(searchData: data));
        }

        //! ------------- VIDEO SEARCH: Loading State
        if (state is SearchVideosLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //! ------------- VIDEO SEARCH: Loaded
        if (state is SearchVideosLoaded) {
          return ListView.builder(
              itemCount: state.videos.length + 2,
              itemBuilder: (BuildContext conext, int index) {
                if (index == 0) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: ((1 - miniPlayerPercentage) * 300),
                  );
                } else if (index == 1) {
                  return VideoInfo(video: video);
                } else {
                  return VideoCard(
                      video: state.videos[index - 2],
                      hasPadding: true,
                      onTap: (video) {
                        final data = SearchDataEntity(
                            // TODO(mikehuntington): remove neovibe.app hardcoded url
                            instanceHost: 'https://vids.neovibe.app',
                            search: '',
                            tagsOfOne: video.tags);

                        context
                            .read<VideoDetailsBloc>()
                            .add(GetVideoDetailsEvent(video: video));

                        // Search for related videos
                        context
                            .read<SearchVideosBloc>()
                            .add(PerformSearchVideosEvent(searchData: data));
                      });
                }
              });
        }

        //! ------------- VIDEO SEARCH: Error State
        if (state is SearchVideosError) {
          return Center(child: Text(state.message));
        }

        //! ------------- No state was triggers (something bad happened)
        return const Center(child: Text(''));
      },
    );
  }

  Widget _buildMainView(
      BuildContext context, VideoEntity video, MediaPlayerState state) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          _buildVideoInfo(context, video),
        ],
      ),
    );
  }
}
