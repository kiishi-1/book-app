import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/basic_basic_model.dart';
import 'package:flutter_book_app/models/book_model.dart';
import 'package:flutter_book_app/utils/all_methods.dart';
import 'package:flutter_book_app/views/Read%20view/components/description_container.dart';
import 'package:flutter_book_app/views/Read%20view/components/image_container.dart';
import 'package:flutter_book_app/core/services/book_services.dart';
import 'package:flutter_book_app/views/bookmark%20view/bookmark_view.dart';
import 'package:flutter_book_app/views/read_webview.dart';

class ReadView extends StatefulWidget {
  ReadView(
      {Key? key,
      // required this.backgroundImage,
      // required this.bookImage,
      // required this.name,
      // required this.rating,
      // required this.year,
      required this.book_id,
      this.bookmarked})
      : super(key: key);
  // String backgroundImage;
  // String bookImage;
  // String name;
  // String year;
  // String rating;
  final String book_id;
  bool? bookmarked;

  @override
  State<ReadView> createState() => _ReadViewState();
}

class _ReadViewState extends State<ReadView> {
  BookServices _bookServices = BookServices();

  BookModel? bookIdData;

  bool onclicked = false;

  //we cannot initialize it as a map or an empty map i.e {} cus the compiler doesn't see BookModel as a map
  //hence, we are make bookIdData nullable
  //we tell the compiler that it can be empty or a non define data can be empty
  //usually we use an empty List [] or Map {} but BookModel it is not a dart defined datatype
  @override
  void initState() {
    widget.bookmarked = widget.bookmarked == null ? false : widget.bookmarked!;
    getBookIdData();
    super.initState();
  }

  getBookIdData() async {
    bookIdData = await _bookServices.getBookById(bookId: widget.book_id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: bookIdData == null
            //here, it is not recognised as a Map by the compiler or it is not a dart defined datatype, we use null
            //since it can be null cus we made it nullable
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                backgroundColor: Colors.black,
                body: ListView(
                  children: [
                    ImageContainer(
                        backgroundImage: bookIdData!.cover,
                        bookImage: bookIdData!.cover),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 4),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: 80,
                                    maxWidth:
                                        MediaQuery.of(context).size.width - 85),
                                child: Text(
                                  bookIdData!.name,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ...List.generate(
                                bookIdData!.authors.length,
                                (index) => Text(bookIdData!.authors[index],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(bookIdData!.published_date,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star_border,
                                      color: Colors.amber),
                                  Text(bookIdData!.rating,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            BookmarkView())));
                              }),
                              child: IconButton(
                                onPressed: (() {
                                  setState(() {
                                    widget.bookmarked = !widget.bookmarked!;

                                    if (widget.bookmarked!) {
                                      AllMethod.addBook(BookModel(
                                        name: bookIdData!.name,
                                        cover: bookIdData!.cover,
                                        book_id: bookIdData!.book_id,
                                        url: bookIdData!.url,
                                        rating: bookIdData!.rating,
                                        year: bookIdData!.year,
                                        synopsis: bookIdData!.synopsis,
                                        authors: bookIdData!.authors,
                                        createdEditions:
                                            bookIdData!.createdEditions,
                                        published_date:
                                            bookIdData!.published_date,
                                        //you passing the data you're getting from the API that is, from bookIdData
                                      ));
                                    } else {
                                      AllMethod.removeBook(BookModel(
                                        name: bookIdData!.name,
                                        cover: bookIdData!.cover,
                                        book_id: bookIdData!.book_id,
                                        url: bookIdData!.url,
                                        rating: bookIdData!.rating,
                                        year: bookIdData!.year,
                                        synopsis: bookIdData!.synopsis,
                                        authors: bookIdData!.authors,
                                        createdEditions:
                                            bookIdData!.createdEditions,
                                        published_date:
                                            bookIdData!.published_date,
                                        //you passing the data you're getting from the API that is, from bookIdData
                                      ));
                                    }
                                  });
                                }),
                                icon: Icon(
                                    widget.bookmarked!
                                        ? Icons.bookmark_add
                                        : Icons.bookmark_add_outlined,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    const Divider(
                      // thickness: 1.0,
                      color: Colors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      // constraints: BoxConstraints(maxHeight: 190),
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(
                          //   height: 6,
                          // ),
                          const Text(
                            'Synopsis',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          // Expanded(
                          //   child: SingleChildScrollView(
                          //       scrollDirection: Axis.vertical,

                          DescriptionContainer(
                            synopsis: bookIdData!.synopsis,
                          ),
                          //     ),
                          // ),
                        ],
                      ),
                    ),
                    const Divider(
                      // thickness: 1.0,
                      color: Colors.white,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          print(MediaQuery.of(context).size.height);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReadWebView(url: bookIdData!.url)));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(9),
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.cyan,
                          ),
                          child: const Center(
                            child: Text(
                              'Read',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
