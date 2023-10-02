// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i7;
import 'package:media_kit/media_kit.dart' as _i11;
import 'package:media_kit_video/media_kit_video.dart' as _i17;
import 'package:miniplayer/miniplayer.dart' as _i8;
import 'package:sliding_up_panel2/sliding_up_panel2.dart' as _i10;

import 'injection.dart' as _i39;
import 'src/core/network/cache_client.dart' as _i3;
import 'src/core/network/network_info.dart' as _i9;
import 'src/features/auth/data/datasources/remote_auth_data_source.dart'
    as _i12;
import 'src/features/auth/data/repositories/auth_repository_impl.dart' as _i22;
import 'src/features/auth/domain/repositories/auth_repository.dart' as _i21;
import 'src/features/auth/domain/usecases/get_auth_status.dart' as _i23;
import 'src/features/auth/domain/usecases/get_logged_in_user.dart' as _i24;
import 'src/features/auth/domain/usecases/login_user.dart' as _i29;
import 'src/features/auth/domain/usecases/logout_user.dart' as _i30;
import 'src/features/auth/domain/usecases/signup_user.dart' as _i32;
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart' as _i34;
import 'src/features/auth/presentation/blocs/login/login_cubit.dart' as _i37;
import 'src/features/common/data/datasources/search_videos_remote_data_source.dart'
    as _i13;
import 'src/features/common/data/repositories/search_videos_repository_impl.dart'
    as _i15;
import 'src/features/common/domain/repositories/search_videos_repository.dart'
    as _i14;
import 'src/features/common/domain/usecases/search_videos.dart' as _i16;
import 'src/features/common/presentation/bloc/instance/instance_cubit.dart'
    as _i6;
import 'src/features/common/presentation/bloc/media_player/media_player_bloc.dart'
    as _i38;
import 'src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart'
    as _i31;
import 'src/features/home/data/datasources/home_videos_remote_data_source.dart'
    as _i5;
import 'src/features/home/data/repositories/home_videos_repository_impl.dart'
    as _i28;
import 'src/features/home/domain/repositories/home_videos_repository.dart'
    as _i27;
import 'src/features/home/domain/usecases/get_home_videos.dart' as _i35;
import 'src/features/home/presentation/bloc/home_bloc.dart' as _i36;
import 'src/features/video_details/data/datasources/video_details_remote_data_source.dart'
    as _i18;
import 'src/features/video_details/data/repositories/video_details_repository_impl.dart'
    as _i20;
import 'src/features/video_details/domain/repositories/video_details_repository.dart'
    as _i19;
import 'src/features/video_details/domain/usecases/get_video_details.dart'
    as _i26;
import 'src/features/video_details/domain/usecases/get_video_details_stream.dart'
    as _i25;
import 'src/features/video_details/presentation/bloc/video_details_block.dart'
    as _i33;

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
    gh.lazySingleton<_i3.CacheClient>(() => registerModule.cacheClient);
    gh.lazySingleton<_i4.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i5.HomeVideosRemoteDataSource>(
        () => _i5.HomeVideosRemoteDataSourceImpl(client: gh<_i4.Client>()));
    gh.factory<_i6.InstanceCubit>(() => _i6.InstanceCubit());
    gh.lazySingleton<_i7.InternetConnection>(
        () => registerModule.internetConnection);
    gh.singleton<_i8.MiniplayerController>(registerModule.miniPlayerController);
    gh.lazySingleton<_i9.NetworkInfo>(
        () => _i9.NetworkInfoImpl(gh<_i7.InternetConnection>()));
    gh.singleton<_i10.PanelController>(registerModule.panelController);
    gh.factory<_i11.PlayerConfiguration>(
      () => registerModule.pConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i12.RemoteAuthDataSource>(
        () => _i12.RemoteAuthDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              httpClient: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i13.SearchVideosRemoteDataSource>(
        () => _i13.SearchVideosRemoteDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              client: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i14.SearchVideosRepository>(
        () => _i15.SearchVideosRepositoryImpl(
              remoteDataSource: gh<_i13.SearchVideosRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i16.SearchVideosUseCase>(
        () => _i16.SearchVideosUseCase(gh<_i14.SearchVideosRepository>()));
    gh.factory<_i17.VideoControllerConfiguration>(
      () => registerModule.vcConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i18.VideoDetailsRemoteDataSource>(
        () => _i18.VideoDetailsRemoteDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              client: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i19.VideoDetailsRepository>(
        () => _i20.VideoDetailsRepositoryImpl(
              remoteDataSource: gh<_i18.VideoDetailsRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i21.AuthRepository>(() => _i22.AuthRespositoryImpl(
          remoteDataSource: gh<_i12.RemoteAuthDataSource>(),
          networkInfo: gh<_i9.NetworkInfo>(),
        ));
    gh.lazySingleton<_i23.GetAuthStatus>(
        () => _i23.GetAuthStatus(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i24.GetLoggedInUser>(
        () => _i24.GetLoggedInUser(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i25.GetVideoDetailsStreamUseCase>(() =>
        _i25.GetVideoDetailsStreamUseCase(gh<_i19.VideoDetailsRepository>()));
    gh.lazySingleton<_i26.GetVideoDetailsUseCase>(
        () => _i26.GetVideoDetailsUseCase(gh<_i19.VideoDetailsRepository>()));
    gh.lazySingleton<_i27.HomeVideosRespository>(
        () => _i28.HomeVideosRespositoryImpl(
              remoteDataSource: gh<_i5.HomeVideosRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i29.LoginUser>(
        () => _i29.LoginUser(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i30.LogoutUser>(
        () => _i30.LogoutUser(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i11.Player>(() => registerModule
        .p(gh<_i11.PlayerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i31.SearchVideosBloc>(() =>
        _i31.SearchVideosBloc(searchVideos: gh<_i16.SearchVideosUseCase>()));
    gh.lazySingleton<_i32.SignupUser>(
        () => _i32.SignupUser(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i17.VideoController>(() => registerModule.vc(
        gh<_i17.VideoControllerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i33.VideoDetailsBloc>(() => _i33.VideoDetailsBloc(
          getVideoDetails: gh<_i26.GetVideoDetailsUseCase>(),
          getVideoDetailsStream: gh<_i25.GetVideoDetailsStreamUseCase>(),
          panelController: gh<_i10.PanelController>(),
        ));
    gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(
          logoutUser: gh<_i30.LogoutUser>(),
          getAuthStatus: gh<_i23.GetAuthStatus>(),
          getLoggedInUser: gh<_i24.GetLoggedInUser>(),
        ));
    gh.lazySingleton<_i35.GetHomeVideos>(
        () => _i35.GetHomeVideos(gh<_i27.HomeVideosRespository>()));
    gh.factory<_i36.HomeBloc>(
        () => _i36.HomeBloc(getHomeVideos: gh<_i35.GetHomeVideos>()));
    gh.factory<_i37.LoginCubit>(
        () => _i37.LoginCubit(loginUser: gh<_i29.LoginUser>()));
    gh.factory<_i38.MediaPlayerBloc>(() => _i38.MediaPlayerBloc(
          controller: gh<_i17.VideoController>(),
          miniController: gh<_i8.MiniplayerController>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i39.RegisterModule {
  @override
  _i3.CacheClient get cacheClient => _i3.CacheClient();

  @override
  _i7.InternetConnection get internetConnection => _i7.InternetConnection();

  @override
  _i8.MiniplayerController get miniPlayerController =>
      _i8.MiniplayerController();

  @override
  _i10.PanelController get panelController => _i10.PanelController();
}
