import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookmarkContainer extends StatelessWidget {
  BookmarkContainer({Key? key, required this.cover, required this.name})
      : super(key: key);
  String cover;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 125, maxWidth: MediaQuery.of(context).size.width - 130),
      //color: Colors.black,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: CachedNetworkImage(
              imageUrl: cover,
              fit: BoxFit.cover,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          const SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: MediaQuery.of(context).size.width - 250),
            child: Text(
              name,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
