class Article {
  late String title;
  late String pub_date;

  Article.fromSearchJson(Map<String, dynamic> parsedJson) {
    title = parsedJson['headline']['main'];
    pub_date = parsedJson['pub_date'];
  }

  Article.fromJson(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    pub_date = parsedJson['published_date'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "pub_date": pub_date,
    };
  }
}
