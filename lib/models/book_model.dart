class BookModel {
  final String name;
  final String cover;
  final String url;
  final String rating;
  final String createdEditions;
  final String year;
  final List<String> authors;
  final String synopsis;
  final String book_id;
  final String published_date;

  BookModel({
    required this.name,
    required this.cover,
    required this.url,
    required this.rating,
    required this.createdEditions,
    required this.year,
    required this.authors,
    required this.synopsis,
    required this.book_id,
    required this.published_date
  });
  //to get from the server
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      name: json["name"],
      cover: json["cover"],
      url: json["url"],
      authors: List<String>.from(json["authors"]),
      createdEditions: json['created_editions'].toString(),
      rating: json['rating'].toString(),
      year: json['year'].toString(),
      synopsis: json["synopsis"],
      book_id: json["book_id"].toString(),
      published_date: json["published_date"],
    );
  }
  //to post to the server
  Map<String, dynamic> toJson() => {
        "name": name,
        "cover": cover,
        "url": url,
        "authors": authors,
        'created_editions': createdEditions,
        'rating': rating,
        'year': year,
        "synopsis": synopsis,
        "book_id": book_id,
        "published_date": published_date,
      };
}
