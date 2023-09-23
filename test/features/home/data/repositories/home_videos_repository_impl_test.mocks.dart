// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_peertuber/test/features/home/data/repositories/home_videos_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_peertuber/src/core/network/network_info.dart' as _i5;
import 'package:flutter_peertuber/src/features/common/data/models/video.dart'
    as _i4;
import 'package:flutter_peertuber/src/features/home/data/datasources/home_videos_remote_data_source.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HomeVideosRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeVideosRemoteDataSource extends _i1.Mock
    implements _i2.HomeVideosRemoteDataSource {
  MockHomeVideosRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.VideoModel>> getHomeVideos() => (super.noSuchMethod(
        Invocation.method(
          #getHomeVideos,
          [],
        ),
        returnValue: _i3.Future<List<_i4.VideoModel>>.value(<_i4.VideoModel>[]),
      ) as _i3.Future<List<_i4.VideoModel>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
