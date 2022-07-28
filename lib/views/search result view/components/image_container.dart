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
            constraints: BoxConstraints(maxHeight: 260),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pj.jpg'), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.cyan),
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
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: bookImage,
                      fit: BoxFit.cover,
                    ),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
