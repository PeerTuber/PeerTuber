import 'package:formz/formz.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class LoggedInUser extends UserEntity {
  final String accessToken;
  final String refreshToken;

  const LoggedInUser({
    required this.accessToken,
    required this.refreshToken,
    required super.account,
    required super.autoPlayNextVideo,
    required super.autoPlayNextVideoPlaylist,
    required super.autoPlayVideo,
    required super.blocked,
    required super.blockedReason,
    required super.createdAt,
    required super.email,
    required super.emailVerified,
    required super.id,
    required super.pluginAuth,
    required super.noInstanceConfigWarningModal,
    required super.noAccountSetupWarningModal,
    required super.noWelcomeModal,
    required super.nsfwPolicy,
    required super.role,
    required super.theme,
    required super.username,
    required super.videoChannels,
    required super.videoQuota,
    required super.videoQuotaDaily,
    required super.p2PEnabled,
    super.lastLoginDate,
  });

  @override
  List<Object?> get props => super.props
    ..add(accessToken)
    ..add(refreshToken);

  static const empty = LoggedInUser(
    accessToken: '-',
    refreshToken: '-',
    account: AccountEntity.empty,
    autoPlayNextVideo: false,
    autoPlayNextVideoPlaylist: false,
    autoPlayVideo: false,
    blocked: false,
    blockedReason: '',
    createdAt: '',
    email: Email.pure(),
    emailVerified: false,
    id: 0,
    pluginAuth: '',
    lastLoginDate: null,
    noInstanceConfigWarningModal: false,
    noAccountSetupWarningModal: false,
    noWelcomeModal: false,
    nsfwPolicy: '',
    role: RoleEntity(id: 0, label: ''),
    theme: '',
    username: Username.pure(),
    videoChannels: [],
    videoQuota: 0,
    videoQuotaDaily: 0,
    p2PEnabled: false,
  );

  @override
  LoggedInUser copyWith({
    String? accessToken,
    String? refreshToken,
    AccountEntity? account,
    bool? autoPlayNextVideo,
    bool? autoPlayNextVideoPlaylist,
    bool? autoPlayVideo,
    bool? blocked,
    String? blockedReason,
    String? createdAt,
    Email? email,
    bool? emailVerified,
    int? id,
    String? pluginAuth,
    DateTime? lastLoginDate,
    bool? noInstanceConfigWarningModal,
    bool? noAccountSetupWarningModal,
    bool? noWelcomeModal,
    String? nsfwPolicy,
    RoleEntity? role,
    String? theme,
    Username? username,
    List<ChannelEntity>? videoChannels,
    int? videoQuota,
    int? videoQuotaDaily,
    bool? p2PEnabled,
  }) {
    return LoggedInUser(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      account: account ?? this.account,
      autoPlayNextVideo: autoPlayNextVideo ?? this.autoPlayNextVideo,
      autoPlayNextVideoPlaylist:
          autoPlayNextVideoPlaylist ?? this.autoPlayNextVideoPlaylist,
      autoPlayVideo: autoPlayVideo ?? this.autoPlayVideo,
      blocked: blocked ?? this.blocked,
      blockedReason: blockedReason ?? this.blockedReason,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      id: id ?? this.id,
      pluginAuth: pluginAuth ?? this.pluginAuth,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      noInstanceConfigWarningModal:
          noInstanceConfigWarningModal ?? this.noInstanceConfigWarningModal,
      noAccountSetupWarningModal:
          noAccountSetupWarningModal ?? this.noAccountSetupWarningModal,
      noWelcomeModal: noWelcomeModal ?? this.noWelcomeModal,
      nsfwPolicy: nsfwPolicy ?? this.nsfwPolicy,
      role: role ?? this.role,
      theme: theme ?? this.theme,
      username: username ?? this.username,
      videoChannels: videoChannels ?? this.videoChannels,
      videoQuota: videoQuota ?? this.videoQuota,
      videoQuotaDaily: videoQuotaDaily ?? this.videoQuotaDaily,
      p2PEnabled: p2PEnabled ?? this.p2PEnabled,
    );
  }
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
