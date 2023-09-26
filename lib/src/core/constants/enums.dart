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

enum SignupFailureReason {
  registrationNotEnabled,
  usernameOrEmailTaken,
  unknown,
}
