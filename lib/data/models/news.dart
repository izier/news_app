class News {
  String source;
  String author;
  String title;
  String url;
  String publishedAt;

  News({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      source: json['source']['name'],
      author: json['author'] ?? '-',
      title: json['title'],
      url: json['url'],
      publishedAt: json['publishedAt'],
    );
  }
}