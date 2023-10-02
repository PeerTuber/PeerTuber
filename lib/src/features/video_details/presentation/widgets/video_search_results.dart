import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart';
import 'package:peertuber/src/features/common/presentation/widgets/widgets.dart';
import 'package:peertuber/src/features/video_details/presentation/widgets/widgets.dart';

class VideoSearchResults extends StatelessWidget {
  const VideoSearchResults({
    super.key,
    required this.miniPlayerPercentage,
    required this.videoDetail,
  });

  final double miniPlayerPercentage;
  final VideoEntity videoDetail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVideosBloc, SearchVideosState>(
      builder: (context, state) {
        if (state is! SearchVideosLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Visibility(
          maintainState: false,
          visible: (MediaQuery.of(context).orientation == Orientation.portrait),
          child: ListView.builder(
              itemCount: state.videos.length + 2,
              itemBuilder: (BuildContext conext, int index) {
                if (index == 0) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: ((1 - miniPlayerPercentage) * 300),
                  );
                } else if (index == 1) {
                  return VideoInfo(video: videoDetail);
                } else {
                  return VideoCard(
                      video: state.videos[index - 2],
                      hasPadding: true,
                      onTap: (video) {
                        context.read<MediaPlayerBloc>().add(LoadMedia(
                              video: video,
                            ));
                      });
                }
              }),
        );
      },
    );
  }
}
