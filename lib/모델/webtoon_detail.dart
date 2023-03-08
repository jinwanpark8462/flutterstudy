class Webtoondetail {
  final String title, about, genre, age;

  Webtoondetail.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
