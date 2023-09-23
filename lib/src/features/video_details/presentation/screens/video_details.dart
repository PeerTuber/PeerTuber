import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_peertuber/injection.dart';
import 'package:flutter_peertuber/src/core/bloc/media_player/media_player_bloc.dart';
import 'package:flutter_peertuber/src/core/bloc/search_videos/search_videos_bloc.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/features/common/presentation/widgets/widgets.dart';
import 'package:flutter_peertuber/src/features/video_details/presentation/bloc/video_details_block.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../widgets/widgets.dart';

class VideoDetails extends HookWidget {
  final VideoEntity video;
  final VideoController videoController;
  final MediaPlayerState playerState;

  const VideoDetails(
      {super.key,
      required this.video,
      required this.videoController,
      required this.playerState});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<VideoDetailsBloc>()
              ..add(GetVideoDetailsEvent(video: video))),
        BlocProvider(create: (_) => getIt<SearchVideosBloc>()),
      ],
      child: SafeArea(
        bottom: false,
        child: _buildVideoPlayerView(
            context, (playerState as MediaPlayerLoaded), videoController),
      ),
    );
  }

  // -- Build Video Player View
  Widget _buildVideoPlayerView(BuildContext context,
      MediaPlayerState playerState, VideoController videoController) {
    return BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
      buildWhen: (previous, current) => (previous != current),
      builder: (context, state) {
        //! ------------- VIDEO DETAILS: Media is already playing
        if (playerState is MediaPlayerPlaying) {
          var video = playerState.video;

          return _buildMainView(context, video, videoController, playerState);
        }

        //! ------------- VIDEO DETAILS: Media is already playing
        if (playerState is MediaPlayerLoaded && state is VideoDetailsLoaded) {
          var newVideo = playerState.video;
          var oldVideo = state.video;

          if (newVideo.id != oldVideo.id) {
            context.read<SearchVideosBloc>().add(ResetSearchEvent());
            context
                .read<VideoDetailsBloc>()
                .add(GetVideoDetailsEvent(video: newVideo));
          }
        }

        //! ------------- VIDEO DETAILS: Loading State
        if (state is VideoDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //! ------------- VIDEO DETAILS: Loaded
        if (state is VideoDetailsLoaded) {
          return _buildMainView(
              context, state.video, videoController, playerState);
        }

        //! ------------- VIDEO DETAILS: Error State
        if (state is VideoDetailsError) {
          return Center(child: Text(state.message));
        }

        //! ------------- No state was triggers (something bad happened)
        return const Center(child: Text(''));
      },
    );
  }

  // -- Build Video Info and Search Data
  Widget _buildVideoInfo(BuildContext context, VideoEntity video) {
    return BlocBuilder<SearchVideosBloc, SearchVideosState>(
      builder: (context, state) {
        //! ------------- VIDEO SEARCH: Initial State
        if (state is SearchVideosInitial) {
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
          // cache the search results in the media player
          //context.read<MediaPlayerBloc>().add(UpdateSuggestedVideos(videos: state.videos));

          return ListView.builder(
              itemCount: state.videos.length + 2,
              itemBuilder: (BuildContext conext, int index) {
                if (index == 0) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 9.0 / 16.0);
                } else if (index == 1) {
                  return VideoInfo(video: video);
                } else {
                  return VideoCard(
                    video: state.videos[index - 2],
                    hasPadding: true,
                  );
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

  Widget _buildMainView(BuildContext context, VideoEntity video,
      VideoController videoController, MediaPlayerState state) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          _buildVideoInfo(context, video),
          VideoPlayer(
            video: video,
            playerState: playerState,
            controller: videoController,
          )
        ],
      ),
    );
  }
}
