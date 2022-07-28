import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/basic_basic_model.dart';
import 'package:flutter_book_app/views/bookmark%20view/bookmark_view.dart';
import 'package:flutter_book_app/views/home%20view/components/genre_categories_container.dart';
import 'package:flutter_book_app/views/home%20view/components/genre_container.dart';
import 'package:flutter_book_app/views/home%20view/components/popular_container.dart';
import 'package:flutter_book_app/views/home%20view/components/popular_tab_container.dart';
import 'package:flutter_book_app/views/Read%20view/read_view.dart';
import 'package:flutter_book_app/core/services/book_services.dart';
import 'package:flutter_book_app/views/search%20result%20view/search_result_view.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
  // List<String> picList = [
  //   'assets/pj.jpg',
  //   'assets/pj2.jpg',
  //   'assets/pj3.jpg',
  //   'assets/pj4.jpg',
  //   'assets/pj5.jpg',
  //   'assets/pj6.jpg',
  // ];
  int selectIndex = 0;
  BookServices _bookServices = BookServices();
  List<BasicBookModel> genreDataList = [];
  List<BasicBookModel> popularDataList = [];
  TextEditingController _controller = TextEditingController();
  buildImage(String picImage, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadView(
                book_id: popularDataList[index].book_id,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
          // image: DecorationImage(image: AssetImage(picImage), fit: BoxFit.fill),
          //use cachednetworkimage
        ),
        child: CachedNetworkImage(
            imageUrl: popularDataList[index].cover, fit: BoxFit.cover),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }

  bool isLoading = false;
  int activeIndex = 0;

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: popularDataList.length,
      effect: const ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.cyan,
        dotColor: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    // getGenreData();
    Future.delayed(Duration(seconds: 2), () => (getPopularData()));
    Future.delayed(Duration(seconds: 4),
        () => (getGenreData(genreCategories[selectIndex])));
    super.initState();
  }

  getGenreData(qq) async {
    setState(() {
      isLoading = true;
    });
    genreDataList = await _bookServices.getBookByGenre(genre: qq);
    setState(() {
      isLoading = false;
    });
  }

  getPopularData() async {
    setState(() {
      isLoading = true;
    });
    popularDataList = await _bookServices.getPopularBooks();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: popularDataList.isEmpty || genreDataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Container(
                  //height: 270,
                  constraints: const BoxConstraints(maxHeight: 320),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                    color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width - 88,
                            height: 40,
                            child: TextFormField(
                              controller: _controller,
                              onFieldSubmitted: (value) {
                                value = _controller.text;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchResultView(
                                              val: value,
                                            )));
                              },
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'Search',
                                  hintMaxLines: 1,
                                  hintStyle: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  //disabledBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                      //style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ))),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookmarkView()));
                              },
                              icon: Icon(
                                Icons.bookmark,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text('Recommended',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: popularDataList.length,
                            options: CarouselOptions(
                              height: 220,
                              enableInfiniteScroll: false,
                              pageSnapping: false,
                              autoPlay: true,
                              reverse: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: ((index, reason) =>
                                  setState(() => activeIndex = index)),
                            ),
                            itemBuilder: (context, index, realIndex) {
                              final picImage = popularDataList[index].cover;

                              return buildImage(picImage, index);
                            },
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          buildIndicator(),
                        ],
                      )
                    ],
                  ),
                )),
                const SliverPinnedHeader(
                  child: PopularTabContainer(),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              popularDataList.length,
                              (index) => GestureDetector(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReadView(
                                              book_id: popularDataList[index]
                                                  .book_id,
                                            ),
                                          ));
                                    }),
                                    child: PopularContainer(
                                      name: popularDataList[index].name,
                                      // author: popularDataList[index].author,
                                      image: popularDataList[index].cover,
                                    ),
                                  )),
                        ],
                      )),
                ),
                SliverPinnedHeader(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ...List.generate(
                      genreCategories.length,
                      (index) => GestureDetector(
                        onTap: (() {
                          genreDataList = [];
                          setState(() {});
                          selectIndex = index;
                          getGenreData(genreCategories[selectIndex]);
                        }),
                        child: GenreCategoriesContainer(
                            text: genreCategories[index],
                            color: selectIndex == index
                                ? Colors.black
                                : Colors.transparent,
                            textColor: selectIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                    )
                  ]),
                )),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              genreDataList.length,
                              (index) => GestureDetector(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReadView(
                                              book_id:
                                                  genreDataList[index].book_id,
                                            ),
                                          ));
                                    }),
                                    child: GenreContainer(
                                      image: genreDataList[index].cover,
                                      name: genreDataList[index].name,
                                    ),
                                  )),
                        ],
                      )),
                ),
              ],
            ),
    ));
  }
}
