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
import 'package:media_kit/media_kit.dart' as _i10;
import 'package:media_kit_video/media_kit_video.dart' as _i16;
import 'package:miniplayer/miniplayer.dart' as _i8;

import 'injection.dart' as _i37;
import 'src/core/network/cache_client.dart' as _i3;
import 'src/core/network/network_info.dart' as _i9;
import 'src/features/auth/data/datasources/remote_auth_data_source.dart'
    as _i11;
import 'src/features/auth/data/repositories/auth_repository_impl.dart' as _i21;
import 'src/features/auth/domain/repositories/auth_repository.dart' as _i20;
import 'src/features/auth/domain/usecases/get_auth_status.dart' as _i22;
import 'src/features/auth/domain/usecases/get_logged_in_user.dart' as _i23;
import 'src/features/auth/domain/usecases/login_user.dart' as _i27;
import 'src/features/auth/domain/usecases/logout_user.dart' as _i28;
import 'src/features/auth/domain/usecases/signup_user.dart' as _i30;
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart' as _i32;
import 'src/features/auth/presentation/blocs/login/login_cubit.dart' as _i35;
import 'src/features/common/data/datasources/search_videos_remote_data_source.dart'
    as _i12;
import 'src/features/common/data/repositories/search_videos_repository_impl.dart'
    as _i14;
import 'src/features/common/domain/repositories/search_videos_repository.dart'
    as _i13;
import 'src/features/common/domain/usecases/search_videos.dart' as _i15;
import 'src/features/common/presentation/bloc/instance/instance_cubit.dart'
    as _i6;
import 'src/features/common/presentation/bloc/media_player/media_player_bloc.dart'
    as _i36;
import 'src/features/common/presentation/bloc/search_videos/search_videos_bloc.dart'
    as _i29;
import 'src/features/home/data/datasources/home_videos_remote_data_source.dart'
    as _i5;
import 'src/features/home/data/repositories/home_videos_repository_impl.dart'
    as _i26;
import 'src/features/home/domain/repositories/home_videos_repository.dart'
    as _i25;
import 'src/features/home/domain/usecases/get_home_videos.dart' as _i33;
import 'src/features/home/presentation/bloc/home_bloc.dart' as _i34;
import 'src/features/video_details/data/datasources/video_details_remote_data_source.dart'
    as _i17;
import 'src/features/video_details/data/repositories/video_details_repository_impl.dart'
    as _i19;
import 'src/features/video_details/domain/repositories/video_details_repository.dart'
    as _i18;
import 'src/features/video_details/domain/usecases/get_video_details.dart'
    as _i24;
import 'src/features/video_details/presentation/bloc/video_details_block.dart'
    as _i31;

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
    gh.factory<_i10.PlayerConfiguration>(
      () => registerModule.pConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i11.RemoteAuthDataSource>(
        () => _i11.RemoteAuthDataSourceImpl(
              cacheClient: gh<_i3.CacheClient>(),
              httpClient: gh<_i4.Client>(),
            ));
    gh.lazySingleton<_i12.SearchVideosRemoteDataSource>(
        () => _i12.SearchVideosRemoteDataSourceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i13.SearchVideosRepository>(
        () => _i14.SearchVideosRepositoryImpl(
              remoteDataSource: gh<_i12.SearchVideosRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i15.SearchVideosUseCase>(
        () => _i15.SearchVideosUseCase(gh<_i13.SearchVideosRepository>()));
    gh.factory<_i16.VideoControllerConfiguration>(
      () => registerModule.vcConfig,
      instanceName: 'Configuration',
    );
    gh.lazySingleton<_i17.VideoDetailsRemoteDataSource>(
        () => _i17.VideoDetailsRemoteDataSourceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i18.VideoDetailsRepository>(
        () => _i19.VideoDetailsRepositoryImpl(
              remoteDataSource: gh<_i17.VideoDetailsRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i20.AuthRepository>(() => _i21.AuthRespositoryImpl(
          remoteDataSource: gh<_i11.RemoteAuthDataSource>(),
          networkInfo: gh<_i9.NetworkInfo>(),
        ));
    gh.lazySingleton<_i22.GetAuthStatus>(
        () => _i22.GetAuthStatus(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i23.GetLoggedInUser>(
        () => _i23.GetLoggedInUser(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i24.GetVideoDetailsUseCase>(
        () => _i24.GetVideoDetailsUseCase(gh<_i18.VideoDetailsRepository>()));
    gh.lazySingleton<_i25.HomeVideosRespository>(
        () => _i26.HomeVideosRespositoryImpl(
              remoteDataSource: gh<_i5.HomeVideosRemoteDataSource>(),
              networkInfo: gh<_i9.NetworkInfo>(),
            ));
    gh.lazySingleton<_i27.LoginUser>(
        () => _i27.LoginUser(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i28.LogoutUser>(
        () => _i28.LogoutUser(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i10.Player>(() => registerModule
        .p(gh<_i10.PlayerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i29.SearchVideosBloc>(() =>
        _i29.SearchVideosBloc(searchVideos: gh<_i15.SearchVideosUseCase>()));
    gh.lazySingleton<_i30.SignupUser>(
        () => _i30.SignupUser(gh<_i20.AuthRepository>()));
    gh.lazySingleton<_i16.VideoController>(() => registerModule.vc(
        gh<_i16.VideoControllerConfiguration>(instanceName: 'Configuration')));
    gh.factory<_i31.VideoDetailsBloc>(() => _i31.VideoDetailsBloc(
        getVideoDetails: gh<_i24.GetVideoDetailsUseCase>()));
    gh.factory<_i32.AuthBloc>(() => _i32.AuthBloc(
          logoutUser: gh<_i28.LogoutUser>(),
          getAuthStatus: gh<_i22.GetAuthStatus>(),
          getLoggedInUser: gh<_i23.GetLoggedInUser>(),
        ));
    gh.lazySingleton<_i33.GetHomeVideos>(
        () => _i33.GetHomeVideos(gh<_i25.HomeVideosRespository>()));
    gh.factory<_i34.HomeBloc>(
        () => _i34.HomeBloc(getHomeVideos: gh<_i33.GetHomeVideos>()));
    gh.factory<_i35.LoginCubit>(
        () => _i35.LoginCubit(loginUser: gh<_i27.LoginUser>()));
    gh.factory<_i36.MediaPlayerBloc>(() => _i36.MediaPlayerBloc(
          controller: gh<_i16.VideoController>(),
          miniController: gh<_i8.MiniplayerController>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i37.RegisterModule {
  @override
  _i3.CacheClient get cacheClient => _i3.CacheClient();
  @override
  _i7.InternetConnection get internetConnection => _i7.InternetConnection();
  @override
  _i8.MiniplayerController get miniPlayerController =>
      _i8.MiniplayerController();
}
