class SearchMetadata {
  final String url;
  final String version;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) {
    return SearchMetadata(url: json['url'], version: json['version']);
  }

  SearchMetadata({required this.url, required this.version});
}
