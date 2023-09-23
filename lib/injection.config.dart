// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i6;
import 'package:media_kit/media_kit.dart' as _i9;
import 'package:media_kit_video/media_kit_video.dart' as _i14;
import 'package:miniplayer/miniplayer.dart' as _i7;

import 'injection.dart' as _i26;
import 'src/core/bloc/instance/instance_cubit.dart' as _i5;
import 'src/core/bloc/media_player/media_player_bloc.dart' as _i25;
import 'src/core/bloc/search_videos/search_videos_bloc.dart' as _i21;
import 'src/core/network/network_info.dart' as _i8;
import 'src/features/common/data/datasources/search_videos_remote_data_source.dart'
    as _i10;
import 'src/features/common/data/repositories/search_videos_repository_impl.dart'
    as _i12;
import 'src/features/common/domain/repositories/search_videos_repository.dart'
    as _i11;
import 'src/features/common/domain/usecases/search_videos.dart' as _i13;
import 'src/features/home/data/datasources/home_videos_remote_data_source.dart'
    as _i4;
import 'src/features/home/data/repositories/home_videos_repository_impl.dart'
    as _i20;
import 'src/features/home/domain/repositories/home_videos_repository.dart'
    as _i19;
import 'src/features/home/domain/usecases/get_home_videos.dart' as _i23;
import 'src/features/home/presentation/bloc/home_bloc.dart' as _i24;
import 'src/features/video_details/data/datasources/video_details_remote_data_source.dart'
    as _i15;
import 'src/features/video_details/data/repositories/video_details_repository_impl.dart'
    as _i17;
import 'src/features/video_details/domain/repositories/video_details_repository.dart'
    as _i16;
import 'src/features/video_details/domain/usecases/get_video_details.dart'
    as _i18;
import 'src/features/video_details/presentation/bloc/video_details_block.dart'
    as _i22;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i4.HomeVideosRemoteDataSource>(
        () => _i4.HomeVideosRemoteDataSourceImpl(client: gh<_i3.Client>()));
    gh.factory<_i5.InstanceCubit>(() => _i5.InstanceCubit());
    gh.lazySingleton<_i6.InternetConnection>(
        () => registerModule.internetConnection);
    gh.singleton<_i7.MiniplayerController>(registerModule.miniPlayerController);
    gh.lazySingleton<_i8.NetworkInfo>(
        () => _i8.NetworkInfoImpl(gh<_i6.InternetConnection>()));
    gh.factory<_i9.PlayerConfiguration>(
      () => registerModule.pConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i10.SearchVideosRemoteDataSource>(
        () => _i10.SearchVideosRemoteDataSourceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i11.SearchVideosRepository>(
        () => _i12.SearchVideosRepositoryImpl(
              remoteDataSource: gh<_i10.SearchVideosRemoteDataSource>(),
              networkInfo: gh<_i8.NetworkInfo>(),
            ));
    gh.lazySingleton<_i13.SearchVideosUseCase>(
        () => _i13.SearchVideosUseCase(gh<_i11.SearchVideosRepository>()));
    gh.factory<_i14.VideoControllerConfiguration>(
      () => registerModule.vcConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i15.VideoDetailsRemoteDataSource>(
        () => _i15.VideoDetailsRemoteDataSourceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i16.VideoDetailsRepository>(
        () => _i17.VideoDetailsRepositoryImpl(
              remoteDataSource: gh<_i15.VideoDetailsRemoteDataSource>(),
              networkInfo: gh<_i8.NetworkInfo>(),
            ));
    gh.lazySingleton<_i18.GetVideoDetailsUseCase>(
        () => _i18.GetVideoDetailsUseCase(gh<_i16.VideoDetailsRepository>()));
    gh.lazySingleton<_i19.HomeVideosRespository>(
        () => _i20.HomeVideosRespositoryImpl(
              remoteDataSource: gh<_i4.HomeVideosRemoteDataSource>(),
              networkInfo: gh<_i8.NetworkInfo>(),
            ));
    gh.lazySingleton<_i9.Player>(() => registerModule
        .p(gh<_i9.PlayerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i21.SearchVideosBloc>(() =>
        _i21.SearchVideosBloc(searchVideos: gh<_i13.SearchVideosUseCase>()));
    gh.lazySingleton<_i14.VideoController>(() => registerModule.vc(
        gh<_i14.VideoControllerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i22.VideoDetailsBloc>(() => _i22.VideoDetailsBloc(
        getVideoDetails: gh<_i18.GetVideoDetailsUseCase>()));
    gh.lazySingleton<_i23.GetHomeVideos>(
        () => _i23.GetHomeVideos(gh<_i19.HomeVideosRespository>()));
    gh.factory<_i24.HomeBloc>(
        () => _i24.HomeBloc(getHomeVideos: gh<_i23.GetHomeVideos>()));
    gh.factory<_i25.MediaPlayerBloc>(() => _i25.MediaPlayerBloc(
          controller: gh<_i14.VideoController>(),
          miniController: gh<_i7.MiniplayerController>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {
  @override
  _i6.InternetConnection get internetConnection => _i6.InternetConnection();
  @override
  _i7.MiniplayerController get miniPlayerController =>
      _i7.MiniplayerController();
}
