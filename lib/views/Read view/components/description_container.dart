import 'package:flutter/material.dart';

class DescriptionContainer extends StatelessWidget {
  DescriptionContainer({Key? key, required this.synopsis}) : super(key: key);
  String synopsis;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        synopsis,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
