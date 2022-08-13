import 'package:flutter/material.dart';
import 'package:flutter_book_app/widgets/skeleton_item.dart';
// import 'package:flutter_news_app2/widgets/skeleton.dart';
// import 'package:flutter_news_app2/widgets/skeleton_item.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Row(
          children: [...List.generate(2, (index) => SkeletonItem())],
        ),
      ),
    );
  }
}
