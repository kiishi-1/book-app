import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularContainer extends StatelessWidget {
  PopularContainer(
      {Key? key,
      required this.name,
      //  required this.author,
      required this.image})
      : super(key: key);
  String name;
  // String author;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxHeight: 235, maxWidth: 150),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 165,
            width: 135,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/pj5.jpg'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                // Text(
                //   "author",
                //   style: TextStyle(
                //       color: Colors.black38,
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold),
                // )
              ],
            ),
          )
        ]));
  }
}
