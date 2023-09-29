enum SortType {
  name,
  duration,
  createdAt,
  publishedAt,
  views,
  likes,
  match,
}

enum SearchTargetType {
  local,
  searchIndex,
}

/// The enumeration of possible authentication status.
///
/// This enumeration is used in the remote authentication data source
/// to represent the different states of authentication.
enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

enum SignupFailureReason {
  registrationNotEnabled,
  usernameOrEmailTaken,
  unknown,
}

enum LoginFailureReason {
  credentialsNotValid,
  tokenExpired,
  clientKeyError,
}

enum AvatarTarget {
  account,
  channel,
}
