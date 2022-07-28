class BasicBookModel {
  final String name;
  final String cover;
  final String book_id;
  // final String author;

  BasicBookModel({
    required this.name,
    required this.cover,
    required this.book_id,
    // required this.author,
  });

  //to get from the server
  factory BasicBookModel.fromJson(Map<String, dynamic> json) {
    return BasicBookModel(
      name: json["name"],
      cover: json["cover"],
      book_id: json["book_id"].toString(),
      // author: json["author"],
    );
  }

  //to post to the server
  Map<String, dynamic> toJson() => {
        "name": name,
        "cover": cover,
        "book_id":book_id,
        // "author": author,
      };
}
