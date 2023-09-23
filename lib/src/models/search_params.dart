class SearchParams {
  int start;
  int count;
  List<String> tagsOneOf;
  String sort;
  String searchTarget;
  String nsfw;

  SearchParams({
    required this.start,
    required this.count,
    required this.tagsOneOf,
    required this.sort,
    required this.searchTarget,
    required this.nsfw,
  });
}
