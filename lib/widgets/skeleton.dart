import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton(
      {this.height, this.width, this.isRounded = true, Key? key, this.radius})
      : super(key: key);
  final double? height, width, radius;
  //you can input your own height, width, radius but you don't have to cus its nullable
  final bool isRounded;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius != null
          // if radius is not null or empty input your own radius
              ? radius!
              //radius! means radius is null and tthe condition states, if raidius is null, use isRounded which is true
              //meaning use 20 as your radius
              : isRounded
                  ? 20
                  : 0,
        ),
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
