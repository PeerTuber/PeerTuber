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
    as _i8;
import 'package:media_kit/media_kit.dart' as _i12;
import 'package:media_kit_video/media_kit_video.dart' as _i19;
import 'package:miniplayer/miniplayer.dart' as _i9;
import 'package:sliding_up_panel2/sliding_up_panel2.dart' as _i11;

import 'injection.dart' as _i45;
import 'src/core/network/cache_client.dart' as _i3;
import 'src/core/network/network_info.dart' as _i10;
import 'src/features/auth/data/datasources/remote_auth_data_source.dart'
    as _i13;
import 'src/features/auth/data/repositories/auth_repository_impl.dart' as _i24;
import 'src/features/auth/domain/repositories/auth_repository.dart' as _i23;
import 'src/features/auth/domain/usecases/get_auth_status.dart' as _i27;
import 'src/features/auth/domain/usecases/get_logged_in_user.dart' as _i29;
import 'src/features/auth/domain/usecases/login_user.dart' as _i34;
import 'src/features/auth/domain/usecases/logout_user.dart' as _i35;
import 'src/features/auth/domain/usecases/signup_user.dart' as _i37;
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart' as _i39;
import 'src/features/auth/presentation/blocs/login/login_cubit.dart' as _i43;
import 'src/features/comments/data/datasources/comment_remote_data_source.dart'
    as _i5;
import 'src/features/comments/data/repositories/comment_repository_impl.dart'
    as _i26;
import 'src/features/comments/domain/repositories/comment_repository.dart'
    as _i25;
import 'src/features/comments/domain/usecases/get_comment_threads.dart' as _i28;
import 'src/features/comments/presentation/bloc/comments/comments_cubit.dart'
    as _i40;
import 'src/features/common/data/datasources/search_videos_remote_data_source.dart'
    as _i14;
import 'src/features/common/data/repositories/search_videos_repository_impl.dart'
    as _i16;
import 'src/features/common/domain/repositories/search_videos_repository.dart'
    as _i15;
import 'src/features/common/domain/usecases/search_videos.dart' as _i17;
import 'src/features/common/presentation/bloc/instance/instance_cubit.dart'
    as _i7;
import 'src/features/common/presentation/bloc/media_player/media_player_bloc.dart'
    as _i44;
import 'src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart'
    as _i36;
import 'src/features/common/presentation/bloc/slide_up_panel/slide_up_panel_cubit.dart'
    as _i18;
import 'src/features/home/data/datasources/home_videos_remote_data_source.dart'
    as _i6;
import 'src/features/home/data/repositories/home_videos_repository_impl.dart'
    as _i33;
import 'src/features/home/domain/repositories/home_videos_repository.dart'
    as _i32;
import 'src/features/home/domain/usecases/get_home_videos.dart' as _i41;
import 'src/features/home/presentation/bloc/home_bloc.dart' as _i42;
import 'src/features/video_details/data/datasources/video_details_remote_data_source.dart'
    as _i20;
import 'src/features/video_details/data/repositories/video_details_repository_impl.dart'
    as _i22;
import 'src/features/video_details/domain/repositories/video_details_repository.dart'
    as _i21;
import 'src/features/video_details/domain/usecases/get_video_details.dart'
    as _i31;
import 'src/features/video_details/domain/usecases/get_video_details_stream.dart'
    as _i30;
import 'src/features/video_details/presentation/bloc/video_details_block.dart'
    as _i38;

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
    gh.lazySingleton<_i5.CommentRemoteDataSource>(
        () => _i5.CommentRemoteDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              client: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i6.HomeVideosRemoteDataSource>(
        () => _i6.HomeVideosRemoteDataSourceImpl(client: gh<_i4.Client>()));
    gh.factory<_i7.InstanceCubit>(() => _i7.InstanceCubit());
    gh.lazySingleton<_i8.InternetConnection>(
        () => registerModule.internetConnection);
    gh.singleton<_i9.MiniplayerController>(registerModule.miniPlayerController);
    gh.lazySingleton<_i10.NetworkInfo>(
        () => _i10.NetworkInfoImpl(gh<_i8.InternetConnection>()));
    gh.singleton<_i11.PanelController>(registerModule.panelController);
    gh.factory<_i12.PlayerConfiguration>(
      () => registerModule.pConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i13.RemoteAuthDataSource>(
        () => _i13.RemoteAuthDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              httpClient: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i14.SearchVideosRemoteDataSource>(
        () => _i14.SearchVideosRemoteDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              client: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i15.SearchVideosRepository>(
        () => _i16.SearchVideosRepositoryImpl(
              remoteDataSource: gh<_i14.SearchVideosRemoteDataSource>(),
              networkInfo: gh<_i10.NetworkInfo>(),
            ));
    gh.lazySingleton<_i17.SearchVideosUseCase>(
        () => _i17.SearchVideosUseCase(gh<_i15.SearchVideosRepository>()));
    gh.factory<_i18.SlideUpPanelCubit>(() =>
        _i18.SlideUpPanelCubit(panelController: gh<_i11.PanelController>()));
    gh.factory<_i19.VideoControllerConfiguration>(
      () => registerModule.vcConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i20.VideoDetailsRemoteDataSource>(
        () => _i20.VideoDetailsRemoteDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              client: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i21.VideoDetailsRepository>(
        () => _i22.VideoDetailsRepositoryImpl(
              remoteDataSource: gh<_i20.VideoDetailsRemoteDataSource>(),
              networkInfo: gh<_i10.NetworkInfo>(),
            ));
    gh.lazySingleton<_i23.AuthRepository>(() => _i24.AuthRespositoryImpl(
          remoteDataSource: gh<_i13.RemoteAuthDataSource>(),
          networkInfo: gh<_i10.NetworkInfo>(),
        ));
    gh.lazySingleton<_i25.CommentRepository>(() => _i26.CommentRepositoryImpl(
          remoteDataSource: gh<_i5.CommentRemoteDataSource>(),
          networkInfo: gh<_i10.NetworkInfo>(),
        ));
    gh.lazySingleton<_i27.GetAuthStatus>(
        () => _i27.GetAuthStatus(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i28.GetCommentThreadUseCase>(
        () => _i28.GetCommentThreadUseCase(gh<_i25.CommentRepository>()));
    gh.lazySingleton<_i29.GetLoggedInUser>(
        () => _i29.GetLoggedInUser(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i30.GetVideoDetailsStreamUseCase>(() =>
        _i30.GetVideoDetailsStreamUseCase(gh<_i21.VideoDetailsRepository>()));
    gh.lazySingleton<_i31.GetVideoDetailsUseCase>(
        () => _i31.GetVideoDetailsUseCase(gh<_i21.VideoDetailsRepository>()));
    gh.lazySingleton<_i32.HomeVideosRespository>(
        () => _i33.HomeVideosRespositoryImpl(
              remoteDataSource: gh<_i6.HomeVideosRemoteDataSource>(),
              networkInfo: gh<_i10.NetworkInfo>(),
            ));
    gh.lazySingleton<_i34.LoginUser>(
        () => _i34.LoginUser(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i35.LogoutUser>(
        () => _i35.LogoutUser(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i12.Player>(() => registerModule
        .p(gh<_i12.PlayerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i36.SearchVideosBloc>(() =>
        _i36.SearchVideosBloc(searchVideos: gh<_i17.SearchVideosUseCase>()));
    gh.lazySingleton<_i37.SignupUser>(
        () => _i37.SignupUser(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i19.VideoController>(() => registerModule.vc(
        gh<_i19.VideoControllerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i38.VideoDetailsBloc>(() => _i38.VideoDetailsBloc(
          getVideoDetails: gh<_i31.GetVideoDetailsUseCase>(),
          getVideoDetailsStream: gh<_i30.GetVideoDetailsStreamUseCase>(),
        ));
    gh.factory<_i39.AuthBloc>(() => _i39.AuthBloc(
          logoutUser: gh<_i35.LogoutUser>(),
          getAuthStatus: gh<_i27.GetAuthStatus>(),
          getLoggedInUser: gh<_i29.GetLoggedInUser>(),
        ));
    gh.factory<_i40.CommentsCubit>(() => _i40.CommentsCubit(
        getCommentThread: gh<_i28.GetCommentThreadUseCase>()));
    gh.lazySingleton<_i41.GetHomeVideos>(
        () => _i41.GetHomeVideos(gh<_i32.HomeVideosRespository>()));
    gh.factory<_i42.HomeBloc>(
        () => _i42.HomeBloc(getHomeVideos: gh<_i41.GetHomeVideos>()));
    gh.factory<_i43.LoginCubit>(
        () => _i43.LoginCubit(loginUser: gh<_i34.LoginUser>()));
    gh.factory<_i44.MediaPlayerBloc>(() => _i44.MediaPlayerBloc(
          controller: gh<_i19.VideoController>(),
          miniController: gh<_i9.MiniplayerController>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i45.RegisterModule {
  @override
  _i3.CacheClient get cacheClient => _i3.CacheClient();

  @override
  _i8.InternetConnection get internetConnection => _i8.InternetConnection();

  @override
  _i9.MiniplayerController get miniPlayerController =>
      _i9.MiniplayerController();

  @override
  _i11.PanelController get panelController => _i11.PanelController();
}
