import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class BigTextSoftWrap extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  BigTextSoftWrap({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
