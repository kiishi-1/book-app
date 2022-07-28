
import 'package:flutter_book_app/models/basic_basic_model.dart';
import 'package:flutter_book_app/models/book_model.dart';
import 'package:flutter_book_app/core/services/book_services.dart';


class AllMethod{
  BookServices _bookServices = BookServices();
  BookModel? bookIdData;
  static List<BookModel> bookmarkList = [];
  List<BasicBookModel> genreDataList = [];
  List<BasicBookModel> popularDataList = [];
  List<BasicBookModel> searchedDataList = [];
  List<String> genreCategories = [
   'Romance',
   'Sci-fi',
   'Fantasy',
   'Comedy',
   'Mystery',
   'Thriller',
   'Horror',
   'Historical',
  ];

  getGenreData(qq) async {
    // setState(() {
    //   isLoading = true;
    // });
    genreDataList = await _bookServices.getBookByGenre(genre: qq);
    // setState(() {
    //   isLoading = false;
    // });
  }

  getPopularData() async {
    // setState(() {
    //   isLoading = true;
    // });
    popularDataList = await _bookServices.getPopularBooks();
    // setState(() {
    //   isLoading = false;
    // });
  }

  // getBookIdData() async {
  //   bookIdData = await _bookServices.getBookById(bookId: widget.book_id);
  //   setState(() {});
  // }

  getSearchedData(qq) async {
    searchedDataList = (await _bookServices.getBooksByName(q: qq));
    //setState(() {});
  }

  static addBook(BookModel item) {
    bookmarkList.add(item);
  }

  static removeBook(BookModel item) {
    bookmarkList.removeWhere((element) => element.name == item.name);
  }

}