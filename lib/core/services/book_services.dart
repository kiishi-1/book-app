import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/basic_basic_model.dart';
import 'package:http/http.dart' as http;

import '../../models/book_model.dart';

class BookServices {
  final String apiHost = 'X-RapidAPI-Host';
  final String api = 'X-RapidAPI-Key';
  final String hostKey = 'hapi-books.p.rapidapi.com';
  final String apiKey = 'f53ec2f7cdmsh87f39fc781bc814p1a5b86jsn498b4d1775e8';

  Future<BookModel> getBookById({required String bookId}) async {
    http.Response response = await http.get(
      Uri.parse('https://hapi-books.p.rapidapi.com/book/$bookId'),
      headers: {apiHost: hostKey, api: apiKey},
    );
    final data = jsonDecode(response.body);
    BookModel book = BookModel.fromJson(data);
    return book;
  }

  Future<List<BasicBookModel>> getBookByGenre({required String genre}) async {
    http.Response response = await http.get(
      Uri.parse('https://hapi-books.p.rapidapi.com/week/$genre'),
      headers: {apiHost: hostKey, api: apiKey},
    );
    final data = jsonDecode(response.body);
    print(data);
    final List<BasicBookModel> genreData = List<BasicBookModel>.from(
      data.map((e) => BasicBookModel.fromJson(e)),
    );
    return genreData;
  }

  Future<List<BasicBookModel>> getPopularBooks() async {
    http.Response response = await http.get(
      Uri.parse('https://hapi-books.p.rapidapi.com/month/2022/3?month=3'),
      headers: {apiHost: hostKey, api: apiKey},
    );
    final data = jsonDecode(response.body);
    // print(data);
    List<BasicBookModel> popularData = List<BasicBookModel>.from(
      data.map((e) => BasicBookModel.fromJson(e)),
    );
    return popularData;
  }

  Future<List<BasicBookModel>> getBooksByName({required String q}) async {
    http.Response response = await http.get(
      Uri.parse('https://hapi-books.p.rapidapi.com/search/$q'),
      headers: {apiHost: hostKey, api: apiKey},
    );
    final data = jsonDecode(response.body);
    // print(data);

     List<BasicBookModel> searchedData = List<BasicBookModel>.from(
      data.map((e) => BasicBookModel.fromJson(e)),
    );
   return searchedData;
  }
}
