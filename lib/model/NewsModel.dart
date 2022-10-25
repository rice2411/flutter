class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  NewsModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  factory NewsModel.fromJson(Map<String, dynamic> obj) {
    return NewsModel(
        author: obj["author"],
        title: obj['title'],
        content: obj['content'],
        description: obj['description'],
        publishedAt: DateTime.parse(obj['publishedAt']),
        url: obj['url'],
        urlToImage: obj['urlToImage']);
  }
}
