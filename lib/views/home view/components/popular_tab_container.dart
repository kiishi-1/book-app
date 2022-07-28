import 'package:flutter/material.dart';

class PopularTabContainer extends StatelessWidget {
  const PopularTabContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Text(
            'popular',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const Spacer(),
          Text('See more',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13)),
        ],
      ),
    );
  }
}
