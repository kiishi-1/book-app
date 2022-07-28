import 'package:flutter/material.dart';

class GenreCategoriesContainer extends StatelessWidget {
  GenreCategoriesContainer({Key? key, required this.text, required this.color, required this.textColor})
      : super(key: key);
  String text;
  Color color;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(4),
      constraints: BoxConstraints(maxHeight: 38,maxWidth: 90,),
     
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.bold, 
            color: textColor),
        ),
      ),
    );
  }
}
