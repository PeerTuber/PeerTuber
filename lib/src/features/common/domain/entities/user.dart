// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';
import 'package:formz/formz.dart';

class UserEntity extends Equatable {
  final AccountEntity account;
  final bool autoPlayNextVideo;
  final bool autoPlayNextVideoPlaylist;
  final bool autoPlayVideo;
  final bool blocked;
  final String blockedReason;
  final String createdAt;
  final Email email;
  final bool emailVerified;
  final int id;
  final String pluginAuth;
  final DateTime lastLoginDate;
  final bool noInstanceConfigWarningModal;
  final bool noAccountSetupWarningModal;
  final bool noWelcomeModal;
  final String nsfwPolicy;
  final RoleEntity role;
  final String theme;
  final Username username;
  final List<ChannelEntity> videoChannels;
  final int videoQuota;
  final int videoQuotaDaily;
  final bool p2PEnabled;

  const UserEntity({
    required this.account,
    required this.autoPlayNextVideo,
    required this.autoPlayNextVideoPlaylist,
    required this.autoPlayVideo,
    required this.blocked,
    required this.blockedReason,
    required this.createdAt,
    required this.email,
    required this.emailVerified,
    required this.id,
    required this.pluginAuth,
    required this.lastLoginDate,
    required this.noInstanceConfigWarningModal,
    required this.noAccountSetupWarningModal,
    required this.noWelcomeModal,
    required this.nsfwPolicy,
    required this.role,
    required this.theme,
    required this.username,
    required this.videoChannels,
    required this.videoQuota,
    required this.videoQuotaDaily,
    required this.p2PEnabled,
  });

  @override
  List<Object?> get props => [
        account,
        autoPlayNextVideo,
        autoPlayNextVideoPlaylist,
        autoPlayNextVideo,
        blocked,
        blockedReason,
        createdAt,
        email,
        emailVerified,
        id,
        pluginAuth,
        lastLoginDate,
        noInstanceConfigWarningModal,
        noAccountSetupWarningModal,
        noWelcomeModal,
        nsfwPolicy,
        role,
        theme,
        username,
        videoChannels,
        videoQuota,
        videoQuotaDaily,
        p2PEnabled,
      ];
}

class RoleEntity extends Equatable {
  final int id;
  final String label;

  const RoleEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}

class BannerEntity extends Equatable {
  final String path;
  final int width;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BannerEntity({
    required this.path,
    required this.width,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        path,
        width,
        createdAt,
        updatedAt,
      ];
}

class OwnerAccountEntity extends Equatable {
  final int id;
  final String uuid;

  const OwnerAccountEntity({
    required this.id,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
      ];
}

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  static final RegExp _usernameRegExp = RegExp(
    r"^[a-z0-9_.]+$",
  );

  @override
  UsernameValidationError? validator(String value) {
    return _usernameRegExp.hasMatch(value)
        ? null
        : UsernameValidationError.invalid;
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z0-9]).{6,}$',
  );

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
