import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/injection.dart';
import 'package:peertuber/src/features/comments/presentation/bloc/comments/comments_cubit.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comments_navigation.dart';
import 'package:peertuber/src/features/common/presentation/bloc/slide_up_panel/slide_up_panel_cubit.dart';
import 'package:peertuber/src/features/video_details/presentation/bloc/video_details_block.dart';
import 'package:peertuber/src/features/video_details/presentation/widgets/widgets.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class VideoDetails extends StatelessWidget {
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
    final miniController = context.read<MediaPlayerBloc>().miniController;

    // -- Hide default layout when in landscape mode.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<VideoDetailsBloc>()
              ..add(GetVideoDetailsEvent(video: video!))),
        BlocProvider(create: (_) => getIt<SearchVideosBloc>()),
        BlocProvider(create: (_) => getIt<SlideUpPanelCubit>()),
        BlocProvider(create: (_) => getIt<CommentsCubit>()),
      ],
      child: BlocConsumer<SlideUpPanelCubit, SlideUpPanelState>(
        listener: (context, state) {
          switch (state) {
            case SlideUpPanelOpened():
              miniController.value?.allowPan = false;
              break;
            case SlideUpPanelClosed():
              miniController.value?.allowPan = true;
              break;
            default:
              break;
          }
        },
        buildWhen: (previous, current) => current is SlideUpPanelInitial,
        builder: (context, state) {
          return BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
            buildWhen: (previous, current) {
              if (current is VideoDetailsLoaded &&
                  previous is VideoDetailsLoaded) {
                return current.video.id != previous.video.id;
              }

              return true;
            },
            builder: (context, state) {
              return SlidingUpPanel(
                controller: context.read<SlideUpPanelCubit>().panelController,
                disableDraggableOnScrolling: true,
                minHeight: 0,
                maxHeight: (MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.width * 9.0 / 16.0)) -
                    MediaQuery.of(context).viewPadding.top,
                onPanelSlide: (position) {
                  if (position == 0) {
                    context.read<SlideUpPanelCubit>().closePanel();
                  }
                },
                panelBuilder: () {
                  if (miniPlayerPercentage == 1 &&
                      state is VideoDetailsLoaded) {
                    return CommentsNavigation(
                      videoId: state.video.id,
                      videoUrl: state.video.remoteHost,
                    );
                  }

                  return null;
                },
                body: SafeArea(
                  bottom: false,
                  top: (miniPlayerPercentage < 0.9) ? false : true,
                  //!-- Video loaded listener
                  child: BlocListener<MediaPlayerBloc, MediaPlayerState>(
                    listenWhen: (previous, current) {
                      if (current is MediaPlayerLoaded) {
                        return current.video.id != video?.id;
                      }

                      return false;
                    },
                    listener: (context, state) {
                      context.read<VideoDetailsBloc>().add(GetVideoDetailsEvent(
                          video: (state as MediaPlayerLoaded).video));
                    },
                    child: Column(
                      children: [
                        //!-- Video details listener
                        BlocListener<VideoDetailsBloc, VideoDetailsState>(
                          listenWhen: (previous, current) =>
                              previous != current,
                          listener: (context, state) {
                            if (state is VideoDetailsLoaded) {
                              final data = SearchDataEntity(
                                  // TODO(mikehuntington): remove neovibe.app hardcoded url
                                  instanceHost: 'https://vids.neovibe.app',
                                  search: '',
                                  tagsOfOne: state.video.tags);

                              // Search for related videos
                              context.read<SearchVideosBloc>().add(
                                  PerformSearchVideosEvent(
                                      searchData: data, video: state.video));
                              context
                                  .read<MediaPlayerBloc>()
                                  .add(PlayMedia(video: state.video));
                            }
                          },
                          child:
                              BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
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
                          child:
                              BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
                            buildWhen: (previous, current) =>
                                current is VideoDetailsLoaded,
                            builder: (context, state) {
                              if (state is VideoDetailsLoaded) {
                                return VideoSearchResults(
                                  miniPlayerPercentage: miniPlayerPercentage,
                                  videoDetail: state.video,
                                );
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
            },
          );
        },
      ),
    );
  }
}
