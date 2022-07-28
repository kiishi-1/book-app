import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/book_model.dart';
import 'package:flutter_book_app/utils/all_methods.dart';
import 'package:flutter_book_app/views/Read%20view/read_view.dart';
import 'package:flutter_book_app/views/bookmark%20view/bookmark_container.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  // List<BookModel> bookmarkList = [];
  // // addBook(BookModel item) {
  // //   bookmarkList.add(item);
  // // }

  // // // removeBook(BookModel item) {
  // // //   bookmarkList.removeWhere((element) => element[] == item[]);
  // // // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: AllMethod.bookmarkList.isEmpty
          //AllFunction.bookmarkList and not _allFunction.bookmarkList cus the class AllFunction was not instanciated since it's static
          ? Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.grey[800],
                    width: double.infinity,
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        print(AllMethod.bookmarkList.length);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 2.8),
                  Text(
                    "No BookMark",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15),
                  )
                ],
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverPinnedHeader(
                    child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 70,
                  color: Colors.grey[800],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ]),
                )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => ReadView(
                                              bookmarked: true,
                                              book_id: AllMethod
                                                  .bookmarkList[index].book_id,
                                            ))));
                              }),
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                constraints:
                                    const BoxConstraints(maxHeight: 145),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  children: [
                                    BookmarkContainer(
                                      cover:
                                          AllMethod.bookmarkList[index].cover,
                                      name: AllMethod.bookmarkList[index].name,
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            AllMethod.removeBook(BookModel(
                                                name: AllMethod
                                                    .bookmarkList[index].name,
                                                cover: AllMethod
                                                    .bookmarkList[index].cover,
                                                url: AllMethod
                                                    .bookmarkList[index].url,
                                                rating: AllMethod
                                                    .bookmarkList[index].rating,
                                                createdEditions: AllMethod
                                                    .bookmarkList[index]
                                                    .createdEditions,
                                                year: AllMethod
                                                    .bookmarkList[index].year,
                                                authors: AllMethod
                                                    .bookmarkList[index]
                                                    .authors,
                                                synopsis: AllMethod
                                                    .bookmarkList[index]
                                                    .synopsis,
                                                book_id: AllMethod
                                                    .bookmarkList[index]
                                                    .book_id,
                                                published_date: AllMethod
                                                    .bookmarkList[index]
                                                    .published_date
                                                //removing from bookmarkList what was gotten from the API
                                                ));
                                          });
                                          // final text = 'Removed From Bookmark';
                                          // final snackBar = SnackBar(
                                          //   elevation: 5,
                                          //   backgroundColor: Colors.black,
                                          //   duration: Duration(seconds: 4),
                                          //   content: Text(
                                          //     text,
                                          //     style: TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          //   // action: SnackBarAction(
                                          //   //   label: 'UNDO',
                                          //   //   textColor: Colors.white,
                                          //   //   onPressed: (){},
                                          //   // ),
                                          // );
                                          // ScaffoldMessenger.of(context)
                                          //   ..hideCurrentSnackBar()
                                          //   ..showSnackBar(snackBar);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                        childCount: AllMethod.bookmarkList.length))
              ],
            ),
    ));
  }
}
