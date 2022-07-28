import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer(
      {Key? key, required this.backgroundImage, required this.bookImage})
      : super(key: key);
  String backgroundImage;
  String bookImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2 - 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.grey),
            child: CachedNetworkImage(
              imageUrl: backgroundImage,
              fit: BoxFit.fill,
            )),
        Positioned(
            top: 30,
            left: 30,
            right: 30,
            bottom: 30,
            child: Align(
              alignment: Alignment.center,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 75, sigmaY: 100),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: bookImage,
                      fit: BoxFit.cover,
                    ),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
              ),
            )),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
