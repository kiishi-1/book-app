import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {
  GenreContainer({Key? key, required this.name, required this.image})
      : super(key: key);
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxHeight: 260, maxWidth: 150),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 165,
            width: 135,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/pj3.jpg'), fit: BoxFit.fill),
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
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                // Text(
                //   'author',
                //   style: TextStyle(
                //       color: Colors.black38,
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold),
                // )
              ],
            ),
          ),
        ]));
  }
}
