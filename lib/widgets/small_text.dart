import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size=0,
    this.height=1.2
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimensions.font14 : size,
        height: height
      )
    );
  }
}