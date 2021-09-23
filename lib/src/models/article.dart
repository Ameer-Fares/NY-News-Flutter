class Article {
  late String title;
  late String pub_date;
  late String type;

  Article.fromSearchJson(Map<String, dynamic> parsedJson) {
    title = parsedJson['headline']['main'];
    String date = parsedJson['pub_date'];
    pub_date = date.replaceRange(date.indexOf('T'), date.length, '');
    type = '';
  }

  Article.fromJson(Map<String, dynamic> parsedJson, String type) {
    title = parsedJson['title'];
    pub_date = parsedJson['published_date'];
    this.type = type;
  }

  Article.fromDb(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    pub_date = parsedJson['pub_date'];
    type = '';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "pub_date": pub_date,
      "type": type,
    };
  }
}
