import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/basic_basic_model.dart';
import 'package:flutter_book_app/models/book_model.dart';
import 'package:flutter_book_app/views/Read%20view/components/description_container.dart';
import 'package:flutter_book_app/views/Read%20view/components/image_container.dart';
import 'package:flutter_book_app/core/services/book_services.dart';
import 'package:flutter_book_app/views/Read%20view/read_view.dart';
import 'package:flutter_book_app/views/home%20view/home_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchResultView extends StatefulWidget {
  SearchResultView({Key? key, required this.val}) : super(key: key);

  String val;

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  BookServices _bookServices = BookServices();
  List<BasicBookModel> searchedDataList = [];

  @override
  void initState() {
    getSearchedData(widget.val);
    super.initState();
  }

  getSearchedData(qq) async {
    searchedDataList = (await _bookServices.getBooksByName(q: qq));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: searchedDataList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: CustomScrollView(
                  //controller: _scrollController,
                  slivers: [
                    SliverPinnedHeader(
                      child: Container(
                        color: Colors.white,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()));
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReadView(
                                          book_id:
                                              searchedDataList[index].book_id,
                                        )));
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: 450,
                              maxWidth: 170,
                            ),
                            margin: const EdgeInsets.fromLTRB(4, 3, 2, 3),
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: [
                                Container(
                                  height: 165,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: searchedDataList[index].cover,
                                    fit: BoxFit.fill,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      searchedDataList[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        childCount: searchedDataList.length,
                      ),
                    )
                  ],
                ),
              ));
  }
}
