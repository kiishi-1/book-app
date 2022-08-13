import 'package:flutter/material.dart';
import 'package:flutter_book_app/widgets/skeleton.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(3),
      width: 137,
      constraints: BoxConstraints(maxHeight: 210),
      child: Column(
        children: [
          // Container(
          //   //margin: const EdgeInsets.all(8),
          //   height: 165,
          //   width: 135,
          //   child:
          const Skeleton(
            width: 135,
            height: 165,
          ),
          // ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   constraints: BoxConstraints(
          //     maxWidth: 135,
          //   ),
          //   child:
          Skeleton(
            width: 135,
            height: 10,
          ),
          // ),
        ],
      ),
    );
  }
}
